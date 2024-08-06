import axios from "axios";
import { Alarm, TimeMap } from "../controllers/alarmController";
import { db, getMessaging } from "../utils/firebaseAdmin";
import { Message } from "firebase-admin/messaging";
import { defaultSerializer } from "..";
import { getYYYYMMDD, getShortTermForecastBaseTime } from "../utils/date";
import { ShortForecastWeather, GetShortTermForecastMapperPayload, getShortTermForecastMapper } from "../utils/weatherDataMapper";
import { logger } from "firebase-functions/v1";

export async function sendNotification(time: number) {
    try {
        if(!TimeMap[time]) {
            throw '잘못된 시간입니다.';
        }

        const AlarmsDocumentRef = db.collection('alarms').doc(TimeMap[time]);
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

                const weatherMap: Record<string, {district: string, data:ShortForecastWeather[]}> = {};

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
                        weatherMap[i] = {
                            district: `${district.siNm} ${district.sggNm} ${district.emdNm}`,
                            data: weather.data,
                        };

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
        
        if (rainningCountOnDistrict > 0) {
            const messages: Message[] = [];

            for(const weather of weatherpromises) {
                const message: Message = {
                    token: weather?.deviceToken ? weather.deviceToken : '',
                    data: {
                        alarmId: weather ? weather.alarmId : '',
                        title: '비오니',
                        body: getNotificationBodyByRainningCountOnDistrict(rainningCountOnDistrict),
                    },
                    android: {
                        priority: 'high',
                    },
                };

                messages.push(message);
            }

            await getMessaging().sendEach(messages);
        }

    } catch (error) {
        logger.error(error);
    }
}

function getNotificationBodyByRainningCountOnDistrict(rainningCountOnDistrict: number) : string {
    let body = '';

    if (rainningCountOnDistrict > 0) {
        body = `설정한 지역 중에 우산이 필요한 곳이 ${rainningCountOnDistrict}군데 있어요.\n오늘은 우산을 챙겨가세요 :D`;
    }

    return body;
}
