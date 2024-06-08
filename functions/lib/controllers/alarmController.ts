import { Request, Response } from 'express';
import { FieldValue, Timestamp } from 'firebase-admin/firestore';

import { db, getAuth } from '../utils/firebaseAdmin';

enum Time {
    '0000', 
}

type Alarm = {
    id: string,
    time: number,
    districts: Array<District>,
    period: string,
    customPeriod: string | null,
    isActivated: boolean,
    createdAt: Date,
    updatedAt: Date,
};

type District = {
    krJibunAddress: string,
    krAddress: string,
    enAddress: string, 
};

type AlarmAddBodyType = {
    time: string,
    districts: Array<District>,
    period: string,
    customPeriod: string | null,
};

const AlarmController = {
    add: async (req: Request, res: Response) => {
        try {
            if(req.headers.authorization !== null) {
                const { uid } = await getAuth().verifyIdToken(req.headers.authorization!);
                
                let {
                    time : timeData,
                    districts,
                    period,
                    customPeriod: customPeriodData,
                } : AlarmAddBodyType = req.body.alarm;
                
                const time = Time[parseInt(timeData)] ?? null;
                
                if(time == null) {
                    throw "지원하지 않는 시간입니다."
                }
                    
                const alarmsUserCollectionRef = db.collection('alarms').doc(time).collection(uid);
                
                const timestamp = FieldValue.serverTimestamp();
                
                const customPeriod =  customPeriodData != null ? Timestamp.fromDate(new Date(customPeriodData)) : null;
                
                const alarm = {
                    districts,
                    period,
                    customPeriod,
                    createdAt: timestamp,
                    updatedAt: timestamp,
                };

                const {id: alarmId} = await  alarmsUserCollectionRef.add(alarm);

                const usersAlarmsCollectionRef = db.collection('users').doc(uid).collection('alarms').doc(alarmId);

                await usersAlarmsCollectionRef.set({
                    ...alarm,
                    time: timeData,
                    id: alarmId,
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

                    const alarm: Alarm = {
                        id: data['id'],
                        time: data['time'],
                        districts: data['districts'],
                        period: data['period'],
                        customPeriod: data['customPeriod'] != null ? data['customPeriod'].toDate() : null,
                        isActivated: data['isActivated'],
                        createdAt: data['createdAt'].toDate(),
                        updatedAt: data['updatedAt'].toDate(),
                    };

                    alarms.push(alarm);
                });
            
                res.status(200).json({ alarms });
            } else {
                throw "허가받지 않은 요청입니다."
            }
        } catch (error) {   
            res.status(500).json({ error });
        }
    }
}

export default AlarmController;