import axios from 'axios';
import { Request, Response } from 'express';

import checkSQLReservedWord from '../utils/checkSQLReservedWord';

type GetDistrictsRequestQueryParamsType = {
    currentPage: string,
    keyword: string,
};

type Address = {
    detBdNmList: string,
    engAddr: string,
    rn: string,
    emdNm: string,
    zipNo: string,
    roadAddrPart1: string,
    roadAddrPart2: string,
    emdNo: string,
    sggNm: string,
    jibunAddr: string,
    siNm: string,
    bdNm: string,
    admCd: string,
    udrtYn: string,
    lnbrMnnm: string,
    roadAddr: string,
    lnbrSlno: string,
    buldMnnm: string,
    bdKdcd: string,
    liNm: string,
    rnMgtSn: string,
    mtYn: string,
    bdMgtSn: string,
    buldSlno: string,
}

type GetAddressResponseDataType = {
    results: {
        common: {
            errorMessage: string,
            counterPerPage: string,
            totalCount: string,
            errorCode: string,
            currentPage: string,
        },
        juso: Array<Address>,
    }
};

const DistrictController = {
    getDistricts: async (req: Request, res: Response) => {
        try {
            const query = req.query as GetDistrictsRequestQueryParamsType;

            if(checkSQLReservedWord(query.keyword)) {
                const confirmKey = process.env['ADDRESS_API_SERVICE_KEY'];
                const currentPage = query.currentPage;
                const countPerPage = 10;
                const keyword = query.keyword;
                const resultType = 'json';
                const hstryYn = 'Y'; //INFO: 변동된 주소정보 포항 여부
                
                const jusoResponse = await axios.get(
                    'https://business.juso.go.kr/addrlink/addrLinkApi.do',
                    {
                        headers: {
                            "Content-Type": "application/json",
                        },
                        params: {
                            'confmKey': confirmKey,
                            currentPage,
                            countPerPage,
                            keyword,
                            resultType,
                            hstryYn,
                        }
                    },
                );
                
                if(jusoResponse.status === 200) {
                    const data: GetAddressResponseDataType = JSON.parse(JSON.stringify(jusoResponse.data));
                    const address = data.results.juso;

                    if(data.results.common.errorCode === '0') {
                        return res.status(200).json({data: address})
                    } else {
                        throw data.results.common.errorCode;
                    }
                } else {
                    throw jusoResponse.status;
                }
            } else {
                throw "SQL예약어: 허용되지 않은 문자가 포함되어 있습니다."
            }
        } catch (error) {
            //TODO: Juso API 에러 코드 처리, 서버 에러, SQL 예약어 
            return res.status(500).json({ error });
        }
    },
};
  
export default DistrictController;