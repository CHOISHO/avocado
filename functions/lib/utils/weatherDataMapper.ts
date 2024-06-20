import { logger } from 'firebase-functions/v1';

interface ForecastResponse {
  response: {
    body: {
      items: {
        item: Array<{
          fcstTime: string;
          category: string;
          fcstValue: string;
        }>;
      };
    };
  };
}

export interface Weather {
  temperature: string;
  precipitationPerHour: string;
  sky: string;
  windSpeedToEastWest: string;
  windSpeedToSouthNorth: string;
  huminity: string;
  precipitationType: string;
  lightning: string;
  windDirection: string;
  windSpeed: string;
  type: WeatherType;
}

export enum WeatherType {
    initial = 'initial',
    rainningDrizzle = 'rainningDrizzle',
    rainningNormal = 'rainningNormal',
    rainningHeavily = 'rainningHeavily',
    rainningDownpour = 'rainningDownpour',
    cloudyPartly = 'cloudyPartly',
    cloudyNormal = 'cloudyNormal',
    sunny = 'sunny',
    snowing = 'snowing'
}
  
function getWeatherType(data: Record<string, string>): WeatherType {
try {
    const sky = data['sky']!;
    const precipitationType = data['precipitationType']!;
    const precipitationPerHour = data['precipitationPerHour']!;
    const lightning = data['lightning']!;

    let weatherType: WeatherType = WeatherType.sunny;

    switch (precipitationType) {
    case '0':
        switch (sky) {
        case '1':
            weatherType = WeatherType.sunny;
            break;
        case '3':
            weatherType = WeatherType.cloudyPartly;
            break;
        case '4':
            weatherType = WeatherType.cloudyNormal;
            break;
        }
        break;
    case '1':
        const preprecipitationPerHourWithoutUnit = precipitationPerHour.split('mm')[0];
        const parsedPrecipitationPerHour = parseFloat(preprecipitationPerHourWithoutUnit);

        // NOTE - 세계기상기구 기준, 비 강도
        if (parsedPrecipitationPerHour < 3) {
            weatherType = WeatherType.rainningDrizzle;
        } else if (parsedPrecipitationPerHour < 15) {
            weatherType = WeatherType.rainningNormal;
        } else if (parsedPrecipitationPerHour < 30) {
            weatherType = WeatherType.rainningHeavily;
        } else {
            weatherType = WeatherType.rainningDownpour;
        }
        break;
    case '2':
        // TODO - 비/눈, API 설명이 부족함
        break;
    case '3':
        weatherType = WeatherType.snowing;
        break;
    case '5':
        // TODO - 빗방울, API 설명이 부족함
        break;
    case '6':
        // TODO - 빗방울눈날림, API 설명이 부족함
        break;
    case '7':
        // TODO - 눈날림, API 설명이 부족함
        break;
    default:
        break;
    }

    return weatherType;
} catch (e) {
    console.error(e);
    return WeatherType.initial;
}
}


function sortByForecastTime(data: Array<{
  fcstTime: string;
  category: string;
  fcstValue: string;
}>) {
  const parsedData: Record<string, Array<{ fcstTime: string; category: string; fcstValue: string }>> = {};

  // Parse the time-based data
  for (const item of data) {
    if (!parsedData[item.fcstTime]) {
      parsedData[item.fcstTime] = [item];
    } else {
      parsedData[item.fcstTime]!.push(item);
    }
  }

  return parsedData;
}

export function getUltraShortTermForecastMapper(data: ForecastResponse): Weather | null {
  try {

    if (!data.response || !data.response.body || !data.response.body.items || !data.response.body.items.item) {
      throw new Error('No data available');
    }

    const items = data.response.body.items.item;
    
    const parsedItems = sortByForecastTime(items);

    const currentTimeItems = parsedItems[`${String(new Date().getHours()).padStart(2, '0')}00`];

    const parsedByCategory: Record<string, string> = {};

    for (const item of currentTimeItems!) {
      const category = item.category;

      if (category && ultraShortTermForecastCategoryMap[category]) {
        const parsedCategory = ultraShortTermForecastCategoryMap[category];
        parsedByCategory[parsedCategory] = item.fcstValue || '';
      }
    }
 

    const weatherType = getWeatherType(parsedByCategory);

    return {
      ...parseWeather(parsedByCategory),
      type: weatherType,
    };
  } catch (e) {
    logger.error(e);
    return null;
  }
}

const ultraShortTermForecastCategoryMap: Record<string, keyof Weather> = {
  T1H: 'temperature',
  RN1: 'precipitationPerHour',
  SKY: 'sky',
  UUU: 'windSpeedToEastWest',
  VVV: 'windSpeedToSouthNorth',
  REH: 'huminity',
  PTY: 'precipitationType',
  LGT: 'lightning',
  VEC: 'windDirection',
  WSD: 'windSpeed',
};

// TODO: 단기 일기 예보 카테고리 
// const shortTermForecastCategoryMap: Record<string, keyof Weather> = {
//   POP: ''
// }

function parseWeather(data: Record<string, string>): Omit<Weather, 'type'> {
  return {
    temperature: data.temperature || '',
    precipitationPerHour: data.precipitationPerHour || '',
    sky: data.sky || '',
    windSpeedToEastWest: data.windSpeedToEastWest || '',
    windSpeedToSouthNorth: data.windSpeedToSouthNorth || '',
    huminity: data.huminity || '',
    precipitationType: data.precipitationType || '',
    lightning: data.lightning || '',
    windDirection: data.windDirection || '',
    windSpeed: data.windSpeed || '',
  };
}

