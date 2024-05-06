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
        String preprecipitationPerHourWithoutUnit = precipitationPerHour.split('mm')[0];
        double parsedPrecipitationPerHour = double.parse(preprecipitationPerHourWithoutUnit);

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
  List items = data['response']['body']['items']['item'];

  Map<String, List> parsedItems = {};

  for (var item in items) {
    if (parsedItems[item['fcstTime']] == null) {
      parsedItems[item['fcstTime']] = [item];
    } else {
      parsedItems[item['fcstTime']]!.add(item);
    }
  }

  // TODO: 초단기예보 아이템 모델 정의
  var filtered = parsedItems[parsedItems.keys.toList()[0]];

  Map<String, String> temp = {};

  try {
    for (var item in filtered!) {
      String? category = item['category'];

      if (category != null) {
        String? parsedCategory = _category[category];

        if (parsedCategory != null) {
          String value = item['fcstValue'] ?? '';
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

  WeatherType weatherType = getWeatherType(temp);

  return Weather.fromJson(temp).copyWith(type: weatherType);
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
