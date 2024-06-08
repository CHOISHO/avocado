import * as express from 'express';

import AlarmController from '../controllers/alarmController';
import checkAuthorization from '../middlewares/checkAuthorization';

const router = express.Router();

router.use(checkAuthorization);

router.post('/add', AlarmController.add);

export default router;