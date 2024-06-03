import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/alarm_repository.dart';
import 'package:avocado/data/repository/weather_repository.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/domain/model/weather_model.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
class HomeViewModelState with _$HomeViewModelState {
  const factory HomeViewModelState({
    @Default(null) Weather? weather,
    @Default([]) List<AlarmModel> alarms,
  }) = _HomeViewModelState;

  factory HomeViewModelState.fromJson(Map<String, dynamic> json) =>
      _$HomeViewModelStateFromJson(json);
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeViewModelState> build() async {
    return await _init();
  }

  Future<HomeViewModelState> _init() async {
    Weather? weather = await ref
        .read(weatherRepositoryProvider.notifier)
        .getUltraShortTermForecast();

    List<AlarmModel> alarms = AlarmRepository().getAlarms();

    return HomeViewModelState(
      weather: weather,
      alarms: alarms,
    );
  }

  Future<void> setDistrict(String value) async {
    Weather? weather = await ref
        .read(weatherRepositoryProvider.notifier)
        .getUltraShortTermForecast(value);

    final previousState = state.asData!.value;
    state = AsyncData(previousState.copyWith(weather: weather));
  }

  void addAlarm(AlarmModel alarm) {
    // TODO: server update
    // REFACT: AlarmRepository 를 참조하여 구현 가능한가?
    final previousState = state.asData!.value;
    final newAlarms = [...previousState.alarms, alarm];

    state = AsyncData(
      previousState.copyWith(
        alarms: newAlarms,
      ),
    );

    AlarmRepository().updateAlarm(newAlarms);
  }

  void editAlarm(int index, AlarmModel editedAlarm) {
    // TODO: server update
    final previousState = state.asData!.value;
    final newAlarms = [...previousState.alarms];

    newAlarms[index] = editedAlarm;

    state = AsyncData(
      previousState.copyWith(
        alarms: newAlarms,
      ),
    );

    AlarmRepository().updateAlarm(newAlarms);
  }

  void removeAlarm(int index) {
    // TODO: server update
    final previousState = state.asData!.value;
    final newAlarms = [...previousState.alarms];

    newAlarms.removeAt(index);

    state = AsyncData(
      previousState.copyWith(
        alarms: newAlarms,
      ),
    );

    AlarmRepository().updateAlarm(newAlarms);
  }

  void toggleAlarm(int index) {
    // TODO: server update
    final previousState = state.asData!.value;
    final newAlarms = [...previousState.alarms];

    newAlarms[index] =
        newAlarms[index].copyWith(isActivated: !newAlarms[index].isActivated);

    state = AsyncData(
      previousState.copyWith(
        alarms: newAlarms,
      ),
    );

    AlarmRepository().updateAlarm(newAlarms);
  }
}
