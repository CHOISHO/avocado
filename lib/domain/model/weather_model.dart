import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart'; // 자동 생성될 파일

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String cityName,
    required double temperature,
    required String description,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
