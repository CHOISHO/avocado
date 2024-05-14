import 'package:logger/logger.dart';

import 'package:avocado/domain/model/weather_model.dart';

Weather getUltraShortTermLiveMapper(Map<String, dynamic> data) {
  List items = data['response']['body']['items']['item'];

  Map<String, dynamic> temp = {};

  try {
    for (var item in items) {
      String? category = item['category'];

      if (category != null) {
        String? parsedCategory = _category[category];

        if (parsedCategory != null) {
          String? value = item['obsrValue'] ?? '';
          temp[parsedCategory] = value;
        } else {
          continue;
        }
      } else {
        continue;
      }
    }
  } catch (e) {
    Logger().e(e);
  }

  Weather weather = Weather.fromJson(temp);

  return weather;
}

//NOTE *****************************************************
// 하늘상태(SKY) 코드 : 맑음(1), 구름많음(3), 흐림(4)
// 강수형태(PTY) 코드 : 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
// *****************************************************
WeatherType getWeatherType(Map<String, String> data) {
  try {
    String sky = data['sky']!;
    String precipitationType = data['precipitationType']!;
    String precipitationPerHour = data['precipitationPerHour']!;
    String lightning = data['lightning']!;

    WeatherType weatherType = WeatherType.sunny;

    switch (precipitationType) {
      case '0':
        switch (sky) {
          case '1':
            weatherType = WeatherType.sunny;
          case '3':
            weatherType = WeatherType.cloudyPartly;
          case '4':
            weatherType = WeatherType.cloudyNormal;
        }
        break;
      case '1':
        String preprecipitationPerHourWithoutUnit =
            precipitationPerHour.split('mm')[0];
        double parsedPrecipitationPerHour =
            double.parse(preprecipitationPerHourWithoutUnit);

        //NOTE - 세계기상기구 기준, 비 강도
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
        //TODO - 비/눈, API 설명이 부족함
        break;
      case '3':
        weatherType = WeatherType.snowing;
        break;
      case '5':
        //TODO - 빗방울, API 설명이 부족함
        break;
      case '6':
        //TODO - 빗방울눈날림, API 설명이 부족함
        break;
      case '7':
        //TODO - 눈날림, API 설명이 부족함
        break;
      default:
    }

    return weatherType;
  } catch (e) {
    Logger().e(e);
    return WeatherType.initial;
  }
}

Weather getUltraShortTermForecastMapper(Map<String, dynamic> data) {
  if (data['response'] == null ||
      data['response']['body'] == null ||
      data['response']['body']['items'] == null ||
      data['response']['body']['items']['item'] == null) {
    throw '데이터가 없습니다.';
  }

  List items = data['response']['body']['items']['item'];

  Map<String, List> parsedItems = {};

  // INFO: 시간대별 데이터 파싱
  for (var item in items) {
    if (parsedItems[item['fcstTime']] == null) {
      parsedItems[item['fcstTime']] = [item];
    } else {
      parsedItems[item['fcstTime']]!.add(item);
    }
  }

  // INFO: 현재 시간 아이템 필터
  var filtered =
      parsedItems['${DateTime.now().hour.toString().padLeft(2, '0')}00'];

  Map<String, String> parsedByCategory = {};

  // INFO: 카테고리별 value 값 할당
  try {
    for (var item in filtered!) {
      String? category = item['category'];

      if (category != null) {
        String? parsedCategory = _category[category];

        if (parsedCategory != null) {
          String value = item['fcstValue'] ?? '';
          parsedByCategory[parsedCategory] = value;
        } else {
          continue;
        }
      } else {
        continue;
      }
    }
  } catch (e) {
    Logger().e(e);
  }

  Logger().d(parsedByCategory);

  WeatherType weatherType = getWeatherType(parsedByCategory);

  return Weather.fromJson(parsedByCategory).copyWith(type: weatherType);
}

Map<String, String> _category = {
  'T1H': 'temperature',
  'RN1': 'precipitationPerHour',
  'SKY': 'sky',
  'UUU': 'windSpeedToEastWest',
  'VVV': 'windSpeedToSouthNorth',
  'REH': 'huminity',
  'PTY': 'precipitationType',
  'LGT': 'lightning',
  'VEC': 'windDirection',
  'WSD': 'windSpeed',
};
