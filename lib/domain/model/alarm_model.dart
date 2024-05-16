import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:avocado/domain/model/district_model.dart';

part 'alarm_model.freezed.dart';
part 'alarm_model.g.dart';

@freezed
class AlarmModel with _$AlarmModel {
  const factory AlarmModel({
    @Default('') String time,
    @Default(District()) District district1,
    @Default(District()) District district2,
    @Default(District()) District district3,
    @Default('') String period,
  }) = _AlarmModel;

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);
}
