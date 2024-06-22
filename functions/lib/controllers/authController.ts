
import { Request, Response } from 'express';
import { DecodedIdToken } from 'firebase-admin/auth';

import { admin, db, getAuth } from '../utils/firebaseAdmin';

const AuthController = {
    create: async (req: Request, res: Response) => {
        try {
            const userRecord = await admin.auth().createUser({
                uid: Date.now().toString(),
            });

            await db.collection('users').doc(userRecord.uid).set({
                uid: userRecord.uid,
                createdAt: admin.firestore.FieldValue.serverTimestamp(),
            });
    
            const customToken = await admin.auth().createCustomToken(userRecord.uid);

            res.status(200).json({ token: customToken });
        } catch (error) {
            res.status(500).json({ error });
        }
    },
    login: async (req: Request, res: Response) => {
       try{
            const body = req.body;
   
            const { uid } : DecodedIdToken = await getAuth().verifyIdToken(body['idToken']);

            await db.collection('users').doc(uid).update({
                deviceToken: body['deviceToken'],
            });

            const userDocument = await db.collection('users').doc(uid).get();

            if(userDocument.exists) {
                res.status(200).json(userDocument.data());
            } else {
                res.status(404).json({ error: 'user 가 존재하지 않습니다.'})
            }
       } catch (error) {
            res.status(500).json({ error });
       }
    },
};

export default AuthController;