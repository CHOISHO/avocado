import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

//TODO - 예보별 날씨 모델 작성

@freezed
class Weather with _$Weather {
  const factory Weather({
    @Default(District()) District district,
    @Default('') String huminity,
    @Default('') String precipitationPerHour,
    @Default('') String precipitationProbability,
    @Default('') String precipitationType,
    @Default('') String sky,
    @Default('') String snowPerHour,
    @Default('') String temperaturePerHour,
    @Default('') String time,
    @Default(WeatherType.initial) WeatherType type,
    @Default('') String wave,
    @Default('') String windDirection,
    @Default('') String windSpeed,
    @Default('') String windSpeedToEastWest,
    @Default('') String windSpeedToSouthNorth,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

enum WeatherType {
  initial('initial', ''),
  rainningDrizzle('rainningDrizzle', '약한 비'),
  rainningNormal('rainningNormal', '보통 비'),
  rainningHeavily('rainningHeavily', '강한 비'),
  rainningDownpour('rainningDownpour', '폭우'),
  cloudyPartly('cloudyPartly', '구름 많음'),
  cloudyNormal('cloudyNormal', '흐림'),
  sunny('sunny', '맑음'),
  snowing('snowing', '눈');

  const WeatherType(this.value, this.label);
  final String value;
  final String label;
}
