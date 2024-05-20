// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlarmModelImpl _$$AlarmModelImplFromJson(Map<String, dynamic> json) =>
    _$AlarmModelImpl(
      time: json['time'] as int? ?? null,
      district1: json['district1'] == null
          ? const District()
          : District.fromJson(json['district1'] as Map<String, dynamic>),
      district2: json['district2'] == null
          ? const District()
          : District.fromJson(json['district2'] as Map<String, dynamic>),
      district3: json['district3'] == null
          ? const District()
          : District.fromJson(json['district3'] as Map<String, dynamic>),
      period: $enumDecodeNullable(_$AlarmPeriodTypeEnumMap, json['period']) ??
          AlarmPeriodType.everyday,
      customPeriod: json['customPeriod'] as String? ?? null,
    );

Map<String, dynamic> _$$AlarmModelImplToJson(_$AlarmModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'district1': instance.district1,
      'district2': instance.district2,
      'district3': instance.district3,
      'period': _$AlarmPeriodTypeEnumMap[instance.period]!,
      'customPeriod': instance.customPeriod,
    };

const _$AlarmPeriodTypeEnumMap = {
  AlarmPeriodType.everyday: 'everyday',
  AlarmPeriodType.weekday: 'weekday',
  AlarmPeriodType.weekend: 'weekend',
  AlarmPeriodType.custom: 'custom',
};
