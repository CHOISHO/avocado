import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required District district,
    required double temperature,
    required int precipitationProbability,
    required double precipitation,
    required double humidity,
    required String baseTime,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
