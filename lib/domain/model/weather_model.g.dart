// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      cityName: json['cityName'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'temperature': instance.temperature,
      'description': instance.description,
    };
