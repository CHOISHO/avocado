// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ultra_short_term_live_mapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      precipitationType: json['precipitationType'] as String? ?? '',
      huminity: json['huminity'] as String? ?? '',
      precipitationPerHour: json['precipitationPerHour'] as String? ?? '',
      temperature: json['temperature'] as String? ?? '',
      windSpeedToEastWest: json['windSpeedToEastWest'] as String? ?? '',
      windDirection: json['windDirection'] as String? ?? '',
      windSpeedToSouthNorth: json['windSpeedToSouthNorth'] as String? ?? '',
      windSpeed: json['windSpeed'] as String? ?? '',
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'precipitationType': instance.precipitationType,
      'huminity': instance.huminity,
      'precipitationPerHour': instance.precipitationPerHour,
      'temperature': instance.temperature,
      'windSpeedToEastWest': instance.windSpeedToEastWest,
      'windDirection': instance.windDirection,
      'windSpeedToSouthNorth': instance.windSpeedToSouthNorth,
      'windSpeed': instance.windSpeed,
    };
