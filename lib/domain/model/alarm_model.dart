import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';

part 'alarm_model.freezed.dart';
part 'alarm_model.g.dart';

@freezed
class AlarmModel with _$AlarmModel {
  const factory AlarmModel({
    @Default(null) int? time,
    @Default(null) District? district1,
    @Default(null) District? district2,
    @Default(null) District? district3,
    @Default(AlarmPeriodType.everyday) AlarmPeriodType period,
    @Default(null) String? customPeriod,
    @Default(true) bool isActivated,
  }) = _AlarmModel;

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);
}

enum AlarmPeriodType {
  everyday('everyday', '매일'),
  weekday('weekday', '주중'),
  weekend('weekend', '주말'),
  custom('custom', '날짜지정');

  const AlarmPeriodType(this.value, this.label);
  final String value;
  final String label;
}
