import * as express from 'express';

import WeatherController from '../controllers/weatherController';
import checkAuthorization from '../middlewares/checkAuthorization';

const router = express.Router();

router.use(checkAuthorization);

router.post('/read', WeatherController.read);

export default router;