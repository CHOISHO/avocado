import * as express from 'express';

import AlarmController from '../controllers/alarmController';

const router = express.Router();

router.post('/add', AlarmController.add);

export default router;