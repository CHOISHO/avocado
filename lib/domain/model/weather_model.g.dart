// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      temperature: (json['temperature'] as num).toDouble(),
      precipitationProbability: json['precipitationProbability'] as int,
      precipitation: (json['precipitation'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      baseTime: json['baseTime'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'temperature': instance.temperature,
      'precipitationProbability': instance.precipitationProbability,
      'precipitation': instance.precipitation,
      'humidity': instance.humidity,
      'baseTime': instance.baseTime,
    };
