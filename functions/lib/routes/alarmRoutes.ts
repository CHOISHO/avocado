import * as express from 'express';

import AlarmController from '../controllers/alarmController';
import checkAuthorization from '../middlewares/checkAuthorization';

const router = express.Router();

router.use(checkAuthorization);

router.post('/create', AlarmController.create);
router.get('/getUserAlarms', AlarmController.getUserAlarms);
router.post('/delete', AlarmController.delete);

export default router;