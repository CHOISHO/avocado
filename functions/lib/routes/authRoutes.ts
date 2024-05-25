import * as express from 'express';

import AuthController from '../controllers/autoController';

const router = express.Router();

router.get('/create', AuthController.create);


export default router;