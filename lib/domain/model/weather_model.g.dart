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
      sky: json['sky'] as String? ?? '',
      huminity: json['huminity'] as String? ?? '',
      type: $enumDecodeNullable(_$WeatherTypeEnumMap, json['type']) ??
          WeatherType.initial,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'district': instance.district,
      'temperature': instance.temperature,
      'precipitationProbability': instance.precipitationProbability,
      'precipitation': instance.precipitation,
      'sky': instance.sky,
      'huminity': instance.huminity,
      'type': _$WeatherTypeEnumMap[instance.type]!,
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
