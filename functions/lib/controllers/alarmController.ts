import { Request, Response } from 'express';
import { FieldValue, Timestamp } from 'firebase-admin/firestore';
import { JsonObject, JsonProperty } from 'typescript-json-serializer';

import { defaultSerializer } from '../';
import { db, getAuth } from '../utils/firebaseAdmin';

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
}

export default AlarmController;