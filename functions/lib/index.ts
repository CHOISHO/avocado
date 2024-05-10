import {HttpsOptions, onRequest} from "firebase-functions/v2/https";
import  * as express  from 'express';

import districtRoutes from "./routes/districtRoutes";


const httpsOptoins: HttpsOptions = { region: 'asia-northeast3'};

const app = express();

app.use('/district', districtRoutes);


exports.app = onRequest(httpsOptoins, app);