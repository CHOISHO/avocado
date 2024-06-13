import axios from 'axios';
import { Request, Response } from 'express';

import { getUltraShortTermForecastBaseTime, getYYYYMMDD } from '../utils/date';
import { getUltraShortTermForecastMapper, Weather, WeatherType } from '../utils/weatherDataMapper';

type GetWeatherBody = {
    location: {
        x: number,
        y: number,
    },
};

const WeatherController = {
    read: async (req: Request, res: Response) => {
        try {
            const { location } : GetWeatherBody = req.body;
            
            const date = new Date();
    
            const response: any = await axios.get(
                'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst',
                {
                    headers: {
                        "Content-Type": "application/json",
                    },
                    params: {
                        'serviceKey': process.env['WEATHER_API_SERVICE_KEY']!,
                        'pageNo': '1',
                        'numOfRows': '1000',
                        'dataType': 'JSON',
                        'base_date': getYYYYMMDD(date),
                        'base_time':
                            getUltraShortTermForecastBaseTime(date),
                        'nx': location.x.toString(),
                        'ny': location.y.toString(),
                    }
                },
            );

            let weather: Weather | null = {
                temperature: '',
                precipitationPerHour: '',
                sky: '',
                windSpeedToEastWest: '',
                windSpeedToSouthNorth: '',
                huminity: '',
                precipitationType: '',
                lightning: '',
                windDirection: '',
                windSpeed: '',
                type: WeatherType.initial
            };

            switch (response['data']['response']['header']['resultCode']) {
                case '00':
                  weather = getUltraShortTermForecastMapper(response['data']);

                  if(weather === null) {
                    throw '데이터 파싱 에러 입니다.';
                  }

                  break;
                case '03':
                  throw '데이터가 없습니다.';
            }
            res.status(200).json({ weather });
        } catch (error) {
            res.status(500).json({ error });
        }
    },
}

export default WeatherController;