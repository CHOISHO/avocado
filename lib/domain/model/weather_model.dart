import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @Default(District()) District district,
    @Default('') String temperature,
    @Default('') String precipitationProbability,
    @Default('') String precipitation,
    @Default('') String sky,
    @Default('') String huminity,
    @Default('') String baseTime,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

enum PrecipitaionValue {
  initial('initial'),
  rainningDrizzle('rainningDrizzle'),
  rainningNormal('rainningNormal'),
  rainningHeavily('rainningHeavily'),
  rainningDownpour('rainningDownpour'),
  cloudyPartly('cloudyPartly'),
  cloudyNormal('cloudyNormal'),
  sunny('sunny'),
  snowing('snowing');

  const PrecipitaionValue(this.value);
  final String value;

  // factory PrecipitaionValue.getValue(String value) {

  //   switch(value) {
  //     case :
  //   }
  // }
}
