import { Request, Response } from "express";
import { logger } from "firebase-functions/v1";

import checkSQLReservedWord from "../middleware/checkSQLReservedWord";


type GetDistrictsRequestQueryParamsType = {
    currentPage: string,
    keyword: string,
};
  
const DistrictController = {
    getDistricts: async (req: Request, res: Response) => {
        try {
            const query = req.query as GetDistrictsRequestQueryParamsType;

            if(checkSQLReservedWord(query.keyword)) {
                return res.status(200).send('COMPLETE');
            } else {
                throw "허용되지 않은 문자가 포함되어 있습니다."
            }
        } catch (error) {
            logger.error('Error fetching:', error, {structuredData: true});
            return res.status(500).json({ error });
        }
    },
};
  
export default DistrictController;