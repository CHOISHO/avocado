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
      huminity: json['huminity'] as String? ?? '',
      precipitationPerHour: json['precipitationPerHour'] as String? ?? '',
      precipitationProbability:
          json['precipitationProbability'] as String? ?? '',
      precipitationType: json['precipitationType'] as String? ?? '',
      sky: json['sky'] as String? ?? '',
      snowPerHour: json['snowPerHour'] as String? ?? '',
      temperaturePerHour: json['temperaturePerHour'] as String? ?? '',
      time: json['time'] as String? ?? '',
      type: $enumDecodeNullable(_$WeatherTypeEnumMap, json['type']) ??
          WeatherType.initial,
      wave: json['wave'] as String? ?? '',
      windDirection: json['windDirection'] as String? ?? '',
      windSpeed: json['windSpeed'] as String? ?? '',
      windSpeedToEastWest: json['windSpeedToEastWest'] as String? ?? '',
      windSpeedToSouthNorth: json['windSpeedToSouthNorth'] as String? ?? '',
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'district': instance.district,
      'huminity': instance.huminity,
      'precipitationPerHour': instance.precipitationPerHour,
      'precipitationProbability': instance.precipitationProbability,
      'precipitationType': instance.precipitationType,
      'sky': instance.sky,
      'snowPerHour': instance.snowPerHour,
      'temperaturePerHour': instance.temperaturePerHour,
      'time': instance.time,
      'type': _$WeatherTypeEnumMap[instance.type]!,
      'wave': instance.wave,
      'windDirection': instance.windDirection,
      'windSpeed': instance.windSpeed,
      'windSpeedToEastWest': instance.windSpeedToEastWest,
      'windSpeedToSouthNorth': instance.windSpeedToSouthNorth,
    };

const _$WeatherTypeEnumMap = {
  WeatherType.initial: 'initial',
  WeatherType.rainningDrizzle: 'rainningDrizzle',
  WeatherType.rainningNormal: 'rainningNormal',
  WeatherType.rainningHeavily: 'rainningHeavily',
  WeatherType.rainningDownpour: 'rainningDownpour',
  WeatherType.cloudyPartly: 'cloudyPartly',
  WeatherType.cloudyNormal: 'cloudyNormal',
  WeatherType.sunny: 'sunny',
  WeatherType.snowing: 'snowing',
};
