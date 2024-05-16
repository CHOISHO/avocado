// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlarmModelImpl _$$AlarmModelImplFromJson(Map<String, dynamic> json) =>
    _$AlarmModelImpl(
      time: json['time'] as String,
      district1: District.fromJson(json['district1'] as Map<String, dynamic>),
      district2: District.fromJson(json['district2'] as Map<String, dynamic>),
      district3: District.fromJson(json['district3'] as Map<String, dynamic>),
      period: json['period'] as String,
    );

Map<String, dynamic> _$$AlarmModelImplToJson(_$AlarmModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'district1': instance.district1,
      'district2': instance.district2,
      'district3': instance.district3,
      'period': instance.period,
    };
