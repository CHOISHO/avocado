import { NextFunction, Request, Response } from 'express';

function checkAuthorization(req: Request, res: Response, next: NextFunction) {
    if (req.headers.authorization) {
        next();
    } else {
        res.status(401).json({ message: 'Unauthorized: Authorization header missing' });
    }
}

export default checkAuthorization;