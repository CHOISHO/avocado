// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      district: json['district'] == null
          ? const District()
          : District.fromJson(json['district'] as Map<String, dynamic>),
      temperature: json['temperature'] as String? ?? '',
      precipitationProbability:
          json['precipitationProbability'] as String? ?? '',
      precipitation: json['precipitation'] as String? ?? '',
      huminity: json['huminity'] as String? ?? '',
      baseTime: json['baseTime'] as String? ?? '',
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'district': instance.district,
      'temperature': instance.temperature,
      'precipitationProbability': instance.precipitationProbability,
      'precipitation': instance.precipitation,
      'huminity': instance.huminity,
      'baseTime': instance.baseTime,
    };
