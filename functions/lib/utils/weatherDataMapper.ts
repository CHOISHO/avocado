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

export interface UltraShortForecastWeather {
  temperature?: string;
  precipitationPerHour?: string;
  sky?: string;
  windSpeedToEastWest?: string;
  windSpeedToSouthNorth?: string;
  huminity?: string;
  precipitationType?: string;
  lightning?: string;
  windDirection?: string;
  windSpeed?: string;
  type?: string | WeatherType;
}

export interface ShortForecastWeather {
  precipitationProbability?: string;
  precipitationType?: string;
  precipitationPerHour?: string;
  huminity?: string;
  snowPerHour?: string;
  sky?: string;
  temperaturePerHour?: string;
  temperatureMin?: string;
  temperatureMax?: string;
  windSpeedToEastWest?: string;
  windSpeedToSouthNorth?: string;
  wave?: string;
  windDirection?: string;
  windSpeed?: string;
  type?: string | WeatherType;
  time: string;
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
  
function getWeatherType(data: UltraShortForecastWeather | ShortForecastWeather): WeatherType {
try {
    const sky = data['sky']!;
    const precipitationType = data['precipitationType']!;
    const precipitationPerHour = data['precipitationPerHour']!;

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

export function getUltraShortTermForecastMapper(data: ForecastResponse): UltraShortForecastWeather | null {
  try {

    if (!data.response || !data.response.body || !data.response.body.items || !data.response.body.items.item) {
      throw new Error('No data available');
    }

    const items = data.response.body.items.item;
    
    const parsedItems = sortByForecastTime(items);

    const currentTimeItems = parsedItems[`${String(new Date().getHours()).padStart(2, '0')}00`];

    const parsedByCategory: UltraShortForecastWeather = {};

    for (const item of currentTimeItems!) {
      const category = item.category;

      if (category && ultraShortTermForecastCategoryMap[category]) {
        const parsedCategory = ultraShortTermForecastCategoryMap[category];
        parsedByCategory[parsedCategory] = item.fcstValue || '';
      }
    }
 

    const weatherType = getWeatherType(parsedByCategory);

    return {
      ...parsedByCategory,
      type: weatherType,
    };
  } catch (e) {
    logger.error(e);
    return null;
  }
}

export type GetShortTermForecastMapperPayload = {
  data:ShortForecastWeather[] | null,
  rainningCountOnDistrict: number,
} | null;

export function getShortTermForecastMapper(data: ForecastResponse): GetShortTermForecastMapperPayload {
  try {

    if (!data.response || !data.response.body || !data.response.body.items || !data.response.body.items.item) {
      throw new Error('No data available');
    }

    const items = data.response.body.items.item;
    
    const parsedItems = sortByForecastTime(items);

    
    const times = Array(4).fill(new Date().getHours()).map(function(value, index){
      let hour = value + (index * 2);

      if(hour >= 24){
        hour -= 24;
      }

      return `${String(hour).padStart(2, '0')}00`;
    } );

    let selectedItems: ShortForecastWeather[] = [];

    for(const time of times) {
      
      if(!!parsedItems[time]){
      
        const parsedByCategory: ShortForecastWeather = {
          time,
        };

        for (const item of parsedItems[time]) {
          const category = item.category;
       
          if (category && shortTermForecastCategoryMap[category]) {
            const parsedCategory = shortTermForecastCategoryMap[category];
            parsedByCategory[parsedCategory] = item.fcstValue || '';
          }
        }

        selectedItems.push(parsedByCategory);
      }
      
    }

    let rainningCountOnDistrict = 0;

    selectedItems = selectedItems.map((item) => {
      const type = getWeatherType(item);
      
      if(getIsRainning(type)) {
        rainningCountOnDistrict++;
      }

      return {
        ...item,
        type,
      };
    });
    
    return {
      data: selectedItems,
      rainningCountOnDistrict,
    };
  } catch (e) {
    logger.error(e);
    return null;
  }
}

const ultraShortTermForecastCategoryMap: Record<string, keyof UltraShortForecastWeather> = {
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

const shortTermForecastCategoryMap: Record<string, keyof ShortForecastWeather> = {
  POP: 'precipitationProbability',
  PTY: 'precipitationType',
  PCP: 'precipitationPerHour',
  REH: 'huminity',
  SNO: 'snowPerHour',
  SKY: 'sky',
  TMP: 'temperaturePerHour',
  TMN: 'temperatureMin',
  TMX: 'temperatureMax',
  UUU: 'windSpeedToEastWest',
  VVV: 'windSpeedToSouthNorth',
  WAV: 'wave',
  VEC: 'windDirection',
  WSD: 'windSpeed',
}

export function getIsRainning(type: WeatherType) {
  return type === WeatherType.rainningDownpour || WeatherType.rainningDrizzle || WeatherType.rainningHeavily || WeatherType.rainningNormal
}