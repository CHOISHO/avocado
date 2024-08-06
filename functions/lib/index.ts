import * as express from 'express';
import { HttpsOptions, onRequest } from 'firebase-functions/v2/https';
import { JsonSerializer } from 'typescript-json-serializer';
import { setGlobalOptions } from 'firebase-functions/v2/options';

import alarmRoutes from './routes/alarmRoutes';
import authRoutes from './routes/authRoutes';
import districtRoutes from './routes/districtRoutes';
import weatherRoutes from './routes/weatherRoutes';
import { onSchedule } from './utils/firebaseAdmin';
import { sendNotification } from './cronJobs/sendNotification';

export const defaultSerializer = new JsonSerializer();

setGlobalOptions({ region: 'asia-northeast3' })

process.env.TZ = 'Asia/Seoul';

const httpsOptoins: HttpsOptions = { region: 'asia-northeast3' };

const app = express();

app.use(express.json());

app.use('/auth', authRoutes);
app.use('/weather', weatherRoutes);
app.use('/district', districtRoutes);
app.use('/alarm', alarmRoutes);


exports.app = onRequest(httpsOptoins, app);

exports.scheduledFunctionCrontab = onSchedule({
    schedule: '0 8,13,17 * * *',
    timeZone: 'Asia/Seoul',
}, async (event) => {
    const time = new Date().getHours();

    await sendNotification(time);
});