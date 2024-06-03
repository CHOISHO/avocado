import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/alarm_repository.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/util/date.dart';

part 'add_alarm_view_model.freezed.dart';
part 'add_alarm_view_model.g.dart';

@freezed
class AddAlarmViewModelState with _$AddAlarmViewModelState {
  const factory AddAlarmViewModelState({
    @Default(AlarmModel()) AlarmModel alarm,
    @Default(false) bool isEditMode,
    @Default(null) int? selectedIndex,
  }) = _AddAlarmViewModelState;

  factory AddAlarmViewModelState.fromJson(Map<String, dynamic> json) =>
      _$AddAlarmViewModelStateFromJson(json);
}

@Riverpod(keepAlive: true)
class AddAlarmViewModel extends _$AddAlarmViewModel {
  @override
  AddAlarmViewModelState build() {
    return const AddAlarmViewModelState();
  }

  void reset() {
    state = state.copyWith(
      alarm: const AlarmModel(),
      isEditMode: false,
      selectedIndex: null,
    );
  }

  void init(int index, AlarmModel alarm) {
    state = state.copyWith(
      alarm: alarm,
      isEditMode: true,
      selectedIndex: index,
    );
  }

  void setTime(int time) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(time: time),
    );
  }

  void setDistrict1(District district) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(
        district1: district,
      ),
    );
  }

  void setDistrict2(District district) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(
        district2: district,
      ),
    );
  }

  void setDistrict3(District district) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(
        district3: district,
      ),
    );
  }

  void setPeriod(AlarmPeriodType period) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(
        period: period,
        customPeriod: null,
      ),
    );
  }

  void setCustomPeriod(DateTime date) {
    state = state.copyWith(
      alarm: state.alarm.copyWith(
        period: AlarmPeriodType.custom,
        customPeriod: date,
      ),
    );
  }

  void addAlarm() {
    ref.read(alarmRepositoryProvider.notifier).addAlarm(state.alarm);
  }

  void editAlarm() {
    if (state.selectedIndex != null) {
      ref
          .read(alarmRepositoryProvider.notifier)
          .editAlarm(state.selectedIndex!, state.alarm);
    }
  }

  void removeAlarm() {
    if (state.selectedIndex != null) {
      ref
          .read(alarmRepositoryProvider.notifier)
          .removeAlarm(state.selectedIndex!);
    }
  }
}
