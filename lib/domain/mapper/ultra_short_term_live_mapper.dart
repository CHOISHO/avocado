import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import 'package:avocado/domain/model/weather_model.dart';

part 'ultra_short_term_live_mapper.freezed.dart';
part 'ultra_short_term_live_mapper.g.dart';

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
  return Weather.fromJson(temp);
}

Weather getUltraShortTermForecastMapper(Map<String, dynamic> data) {
  List items = data['response']['body']['items']['item'];

  Map<String, dynamic> temp = {};

  Logger().i(items);
  try {
    for (var item in items) {
      String? category = item['category'];
      Logger().i(category);

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

    Logger().i(temp);
  } catch (e) {
    Logger().e(e);
  }
  return Weather.fromJson(temp);
}

Map<String, String> _category = {
  'PTY': 'precipitationType',
  'REH': 'huminity',
  'RN1': 'precipitationPerHour',
  'T1H': 'temperature',
  'UUU': 'windSpeedToEastWest',
  'VEC': 'windDirection',
  'VVV': 'windSpeedToSouthNorth',
  'WSD': 'windSpeed',
};

@freezed
class Item with _$Item {
  factory Item({
    @Default('') String? precipitationType,
    @Default('') String? huminity,
    @Default('') String? precipitationPerHour,
    @Default('') String? temperature,
    @Default('') String? windSpeedToEastWest,
    @Default('') String? windDirection,
    @Default('') String? windSpeedToSouthNorth,
    @Default('') String? windSpeed,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
