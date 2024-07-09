// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlarmModelImpl _$$AlarmModelImplFromJson(Map<String, dynamic> json) =>
    _$AlarmModelImpl(
      id: json['id'] as String? ?? null,
      time: (json['time'] as num?)?.toInt() ?? null,
      district1: json['district1'] == null
          ? null
          : District.fromJson(json['district1'] as Map<String, dynamic>),
      district2: json['district2'] == null
          ? null
          : District.fromJson(json['district2'] as Map<String, dynamic>),
      district3: json['district3'] == null
          ? null
          : District.fromJson(json['district3'] as Map<String, dynamic>),
      period: $enumDecodeNullable(_$AlarmPeriodTypeEnumMap, json['period']) ??
          AlarmPeriodType.everyday,
      customPeriod: json['customPeriod'] == null
          ? null
          : DateTime.parse(json['customPeriod'] as String),
      isActivated: json['isActivated'] as bool? ?? true,
    );

Map<String, dynamic> _$$AlarmModelImplToJson(_$AlarmModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'district1': instance.district1,
      'district2': instance.district2,
      'district3': instance.district3,
      'period': _$AlarmPeriodTypeEnumMap[instance.period]!,
      'customPeriod': instance.customPeriod?.toIso8601String(),
      'isActivated': instance.isActivated,
    };

const _$AlarmPeriodTypeEnumMap = {
  AlarmPeriodType.everyday: 'everyday',
  AlarmPeriodType.weekday: 'weekday',
  AlarmPeriodType.weekend: 'weekend',
  AlarmPeriodType.custom: 'custom',
};

_$AlarmWeatherModelImpl _$$AlarmWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AlarmWeatherModelImpl(
      district: json['district'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      needUmbrella: json['needUmbrella'] as bool? ?? false,
    );

Map<String, dynamic> _$$AlarmWeatherModelImplToJson(
        _$AlarmWeatherModelImpl instance) =>
    <String, dynamic>{
      'district': instance.district,
      'data': instance.data,
      'needUmbrella': instance.needUmbrella,
    };
