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
    @Default('') String huminity,
    @Default('') String baseTime,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
