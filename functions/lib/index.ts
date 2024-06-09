import * as express from 'express';
import { HttpsOptions, onRequest } from 'firebase-functions/v2/https';
import { JsonSerializer } from 'typescript-json-serializer';

import alarmRoutes from './routes/alarmRoutes';
import authRoutes from './routes/authRoutes';
import districtRoutes from './routes/districtRoutes';

export const defaultSerializer = new JsonSerializer();

const httpsOptoins: HttpsOptions = { region: 'asia-northeast3'};

const app = express();

app.use(express.json());

app.use('/auth', authRoutes);
app.use('/district', districtRoutes);
app.use('/alarm', alarmRoutes);


exports.app = onRequest(httpsOptoins, app);
