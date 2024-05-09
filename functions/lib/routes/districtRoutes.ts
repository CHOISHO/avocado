import  * as express  from 'express';

import DistrictController from '../controllers/districtController';


const router = express.Router();

router.get('/getDistricts', DistrictController.getDistricts);

export default router;