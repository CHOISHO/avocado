import { Request, Response } from 'express';
import { FieldValue, Timestamp } from 'firebase-admin/firestore';
import { JsonObject, JsonProperty } from 'typescript-json-serializer';
import { Message } from 'firebase-admin/messaging';
import axios from 'axios';

import { defaultSerializer } from '../';
import { db, getAuth, getMessaging } from '../utils/firebaseAdmin';
import { getShortTermForecastBaseTime, getYYYYMMDD } from '../utils/date';
import { getIsRainning, getShortTermForecastMapper, GetShortTermForecastMapperPayload, ShortForecastWeather } from '../utils/weatherDataMapper';

enum Time {
    '0000', 
}

type District = {
    administrativeArea: string,
    subLocality: string,
    thoroughfare: string,
    streetAddress: string,
    streetNameAddress: string,
    englishStreetNameAddress: string,
    latitude: number,
    longitude: number,
    x: number,
    y: number,
};

type AlarmPeriodType =  '매일' | '주중' | '주말' | '날짜지정';

type AlarmAddBodyType = {
    time: number,
    district1: District,
    district2: District | null,
    district3: District | null,
    period: AlarmPeriodType,
    customPeriod: Date | null,
    isActivated: boolean,
};

type AlarmUpdateBodyType = AlarmAddBodyType & {
    id: string,
};

@JsonObject()
export class Alarm {
    constructor(
        @JsonProperty()
        public id: string,
        @JsonProperty()
        public time: number,
        @JsonProperty()
        public district1: District,
        @JsonProperty()
        public district2: District | null,
        @JsonProperty()
        public district3: District | null,
        @JsonProperty()
        public period: AlarmPeriodType,
        @JsonProperty({
            beforeDeserialize: value => value instanceof Timestamp ? value.toDate() : value,
        })
        public customPeriod: Timestamp | Date | null,
        @JsonProperty()
        public isActivated: boolean,
        @JsonProperty({
            beforeDeserialize: value => value instanceof Timestamp ? value.toDate() : value,
        })
        public createdAt: Timestamp | Date,
        @JsonProperty({
            beforeDeserialize: value => value instanceof Timestamp ? value.toDate() : value,
        })
        public updatedAt: Timestamp | Date,
    ) {
    }
}

const AlarmController = {
    create: async (req: Request, res: Response) => {
        try {
            if(req.headers.authorization !== null) {
                const { uid } = await getAuth().verifyIdToken(req.headers.authorization!);
                let {
                    time : timeData,
                    customPeriod: customPeriodData,
                } : AlarmAddBodyType = req.body.alarm;
                
                const time = Time[timeData] ?? null;
                
                if(time == null) {
                    throw "지원하지 않는 시간입니다."
                }
                    
                const alarmsUserCollectionRef = db.collection('alarms').doc(time).collection(uid);
                
                const timestamp = FieldValue.serverTimestamp();
                
                const customPeriod =  customPeriodData != null ? Timestamp.fromDate(new Date(customPeriodData)) : null;
                
                const alarm = {
                    ...req.body.alarm,
                    customPeriod,
                    createdAt: timestamp,
                    updatedAt: timestamp,
                };

                const {id: alarmId} = await  alarmsUserCollectionRef.add(alarm);

                const usersAlarmsCollectionRef = db.collection('users').doc(uid).collection('alarms').doc(alarmId);

                await usersAlarmsCollectionRef.set({
                    ...alarm,
                    id: alarmId,
                    time: timeData,
                    isActivated: true,
                });

                res.status(200).json({ alarmId });
            } else {
                throw "허가받지 않은 요청입니다."
            }
        } catch (error) {
            res.status(500).json({ error });
        }
    },
    getUserAlarms: async (req: Request, res: Response) => {
        try {
            if(req.headers.authorization !== null) {
                const { uid } = await getAuth().verifyIdToken(req.headers.authorization!);
                const alarmsCollection = db.collection('users').doc(uid).collection('alarms');
                const snapshot = await alarmsCollection.get();
            
                let alarms: Array<Alarm> = [];

                snapshot.forEach(doc => {
                    const data = doc.data();

                    const alarm = defaultSerializer.deserialize(data, Alarm);
                    
                    if(alarm instanceof Alarm) {
                        alarms.push(alarm);
                    }
                });

                res.status(200).json({ alarms });
            } else {
                throw "허가받지 않은 요청입니다."
            }
        } catch (error) {   
            res.status(500).json({ error });
        }
    },
    update: async (req: Request, res: Response) => {
        try {
            const userId = req.uid;

            let {
                id: alarmId,
                time : timeData,
                customPeriod: customPeriodData,
            } : AlarmUpdateBodyType = req.body.alarm;

              
            const time = Time[timeData] ?? null;
                
            if(time == null) {
                throw "지원하지 않는 시간입니다."
            }
                            
            const timestamp = FieldValue.serverTimestamp();
            
            const customPeriod =  customPeriodData != null ? Timestamp.fromDate(new Date(customPeriodData)) : null;
            
            const alarm = {
                ...req.body.alarm,
                customPeriod,
                updatedAt: timestamp,
            };

            const usersAlarmsCollectionRef = db.collection('users').doc(userId).collection('alarms').doc(alarmId);
            const alarmsUserAlarmDocumentRef = db.collection('alarms').doc(time).collection(userId).doc(alarmId);

            await usersAlarmsCollectionRef.update(alarm);
            await alarmsUserAlarmDocumentRef.update(alarm);

            res.status(200).json({});
        } catch (error) {
            res.status(500).json({ error });
        }
    },
    delete: async (req: Request, res: Response) => {
        try {
            const userId = req.uid;
            const alarmId = req.body.alarmId;

            const userAlarmDocumentRef = db.collection('users').doc(userId).collection('alarms').doc(alarmId);
            
            const data = (await userAlarmDocumentRef.get()).data();

            if (data === null) {
                throw '존재하지 않는 데이터 입니다.'
            }

            const alarm = defaultSerializer.deserialize(data!, Alarm);
            
            if(!(alarm instanceof Alarm)) {
                throw '올바르지 않은 형식 입니다.'
            }

            const time = Time[alarm!.time];
            
            const alarmDocumentRef = db.collection('alarms').doc(time).collection(userId).doc(alarmId);

            await userAlarmDocumentRef.delete();
            await alarmDocumentRef.delete();

            res.status(200).json({ });
        } catch (error) {
            res.status(500).json({ error });
        }
    },
    sendNotification: async (req: Request, res: Response) => {
        const AlarmsDocumentRef = db.collection('alarms').doc('0000'); // TODO: cronJob 시간 정해지면 기준시간으로 적용
        const AlarmsUsersRef = await AlarmsDocumentRef.listCollections();

        const activatedAlarmList: {data: Alarm, userId: string, alarmId: string,  deviceToken: string | null}[] = [];
        
        for(const AlarmUser of AlarmsUsersRef){
            const userSnapshot = await db.collection('users').doc(AlarmUser.id).get();
            const activatedAlarmSnapshot = await AlarmUser.where('isActivated', '==', true).get();

            if(activatedAlarmSnapshot.empty) {

            } else {
                for(const alarmSnapshot of activatedAlarmSnapshot.docs) {
                    const alarmWithData = {
                        data: defaultSerializer.deserialize<Alarm>(alarmSnapshot.data(), Alarm) as Alarm,
                        userId: AlarmUser.id,
                        alarmId: alarmSnapshot.id,
                        deviceToken: userSnapshot.data() ? userSnapshot.data()!['deviceToken'] : null,
                    };

                    activatedAlarmList.push(alarmWithData);
                }
            }
        }

        let rainningCountOnDistrict = 0;

        const getWeatherpromises = activatedAlarmList.map(async (alarm) => {
            try {
                const districtList = [
                    alarm.data['district1'],
                    alarm.data['district2'],
                    alarm.data['district3'],
                ].filter(district => district !== null);

                const date = new Date();

                const weatherMap: Record<string, ShortForecastWeather[]> = {};

                for (let i=0; i<districtList.length; i++) {
                    const  district =  districtList[i];

                    if(district === null) {
                        continue;
                    }

                    const weatherResponse = await axios.get(
                        'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst',
                        {
                            headers: {
                                "Content-Type": "application/json",
                            },
                            params: {
                                'serviceKey': process.env['WEATHER_API_SERVICE_KEY']!,
                                'pageNo': '1',
                                'numOfRows': '100',
                                'dataType': 'JSON',
                                'base_date': getYYYYMMDD(date),
                                'base_time':
                                    getShortTermForecastBaseTime(date),
                                'nx': district.x.toString(),
                                'ny': district.y.toString(),
                            }
                        },
                    );
    
                    let weather: GetShortTermForecastMapperPayload = null;
                    
                    switch (weatherResponse['data']['response']['header']['resultCode']) {
                        case '00':
                            weather = getShortTermForecastMapper(weatherResponse['data']);
    
                            if(weather === null) {
                                throw '데이터 파싱 에러 입니다.';
                            }
    
                            break;
                        case '03':
                            throw '데이터가 없습니다.';
                    }
    
                    if(weather !== null && weather.data !== null){
                        weatherMap[i] = weather.data;

                        if(weather.rainningCountOnDistrict > 0) {
                            rainningCountOnDistrict++;
                        }
                    } else {
                        throw '데이터가 없습니다.'
                    }
                }

                await AlarmsDocumentRef.collection(alarm.userId).doc(alarm.alarmId).set({'weather': weatherMap}, {merge: true});

                return {
                    alarmId: alarm.alarmId,
                    userId: alarm.userId,
                    deviceToken: alarm.deviceToken,
                };
            } catch (error) {
                return null;
            }
        });

        const weatherpromises = await Promise.all(getWeatherpromises);

        if (rainningCountOnDistrict === 0) {
            const messages: Message[] = [];

            for(const weather of weatherpromises) {
                const message: Message = {
                    notification: {
                        title: '비오니',
                        body: getNotificationBodyByRainningCountOnDistrict(rainningCountOnDistrict),
                    },
                    data: {
                        alarmId: weather ? weather.alarmId : '',
                        userId:  weather ? weather.userId : '',
                    },
                    token: weather?.deviceToken ? weather.deviceToken : '',
                };
    
                messages.push(message);
            }
    
            await getMessaging().sendEach(messages);
        }

        res.status(200).json({})
    },
}

function getNotificationBodyByRainningCountOnDistrict(rainningCountOnDistrict: number) : string{
    let body = '';

    if (rainningCountOnDistrict === 0) {
        body = ''
    } else {
        body = `설정한 지역 중에 우산이 필요한 곳이 ${rainningCountOnDistrict}군데 있어요.\n오늘은 우산을 챙겨가세요 :D`;
    }

    return body;
}

export default AlarmController;