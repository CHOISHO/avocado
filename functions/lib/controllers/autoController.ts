
import { Request, Response } from 'express';

import admin from '../utils/firebaseAdmin';

const AuthController = {
    create: async (req: Request, res: Response) => {
        try {
            const userRecord = await admin.auth().createUser({
                uid: `anonymous_${Date.now()}`,
            });
    
            const customToken = await admin.auth().createCustomToken(userRecord.uid);

            res.json({ token: customToken });
        } catch (error) {
            res.status(500).json({error: error});
        }
    }
};

export default AuthController;