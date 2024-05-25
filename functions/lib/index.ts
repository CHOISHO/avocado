import * as express from 'express';
import { HttpsOptions, onRequest } from 'firebase-functions/v2/https';

import authRoutes from './routes/authRoutes';
import districtRoutes from './routes/districtRoutes';

const httpsOptoins: HttpsOptions = { region: 'asia-northeast3'};

const app = express();

app.use('/auth', authRoutes);
app.use('/district', districtRoutes);


exports.app = onRequest(httpsOptoins, app);
