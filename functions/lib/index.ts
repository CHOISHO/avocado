import {HttpsOptions, onRequest} from "firebase-functions/v2/https";
import { initializeApp } from "firebase-admin/app";
import  * as express  from 'express';

import districtRoutes from "./routes/districtRoutes";


initializeApp();

const httpsOptoins: HttpsOptions = {region: 'asia-northeast3'};

const app = express();


app.use('/district', districtRoutes);


export const api = onRequest(httpsOptoins, app);

