import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';

part 'alarm_model.freezed.dart';
part 'alarm_model.g.dart';

@freezed
class AlarmModel with _$AlarmModel {
  const factory AlarmModel({
    @Default(null) int? time,
    @Default(District()) District district1,
    @Default(District()) District district2,
    @Default(District()) District district3,
    @Default(AlarmPeriodType.everyday) AlarmPeriodType period,
    @Default(null) String? customPeriod,
  }) = _AlarmModel;

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);
}

enum AlarmPeriodType {
  everyday('everyday', '매일'),
  weekday('weekday', '주중'),
  weekend('weekend', '강한 비'),
  custom('custom', '날짜지정');

  const AlarmPeriodType(this.value, this.label);
  final String value;
  final String label;
}
