import { NextFunction, Request, Response } from 'express';

import { getAuth } from '../utils/firebaseAdmin';

async function checkAuthorization(req: Request, res: Response, next: NextFunction) {
    if (req.headers.authorization) {
        const { uid } = await getAuth().verifyIdToken(req.headers.authorization!);
        
        req.uid = uid;

        next();
    } else {
        res.status(401).json({ message: 'Unauthorized: Authorization header missing' });
    }
}

export default checkAuthorization;