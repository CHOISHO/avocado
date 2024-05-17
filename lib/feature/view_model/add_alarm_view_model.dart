import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/domain/model/alarm_model.dart';

part 'add_alarm_view_model.freezed.dart';
part 'add_alarm_view_model.g.dart';

@freezed
class AddAlarmViewModelState with _$AddAlarmViewModelState {
  const factory AddAlarmViewModelState({
    @Default(AlarmModel()) AlarmModel alarm,
  }) = _AddAlarmViewModelState;

  factory AddAlarmViewModelState.fromJson(Map<String, dynamic> json) =>
      _$AddAlarmViewModelStateFromJson(json);
}

@riverpod
class AddAlarmViewModel extends _$AddAlarmViewModel {
  @override
  AddAlarmViewModelState build() {
    return const AddAlarmViewModelState();
  }

  void setPeriod(AlarmPeriodType period) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(period: period),
    );

    // TODO: 날짜 지정 로직 - selectedDate 변수를 상태값으로 따로 저장하는게 나을듯
  }
}
