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
    AlarmRepository().addAlarm(alarm);

    final previousState = state.asData!.value;

    state = AsyncData(
      previousState.copyWith(
        alarms: [...previousState.alarms, alarm],
      ),
    );
  }

  void editAlarm(int index, AlarmModel editedAlarm) {
    final previousState = state.asData!.value;

    List<AlarmModel> newAlarms = [];

    for (var i = 0; i < previousState.alarms.length; i++) {
      if (index == i) {
        newAlarms.add(editedAlarm);
      } else {
        newAlarms.add(previousState.alarms[i]);
      }
    }

    state = AsyncData(
      previousState.copyWith(
        alarms: newAlarms,
      ),
    );
  }

  void toggleAlarm(int index) {
    final previousState = state.asData!.value;
    var tempAlarm = previousState.alarms.toList();

    tempAlarm[index] =
        tempAlarm[index].copyWith(isActivated: !tempAlarm[index].isActivated);

    state = AsyncData(
      previousState.copyWith(
        alarms: tempAlarm,
      ),
    );
  }
}
