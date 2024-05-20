import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    Weather? weather = await ref
        .watch(weatherRepositoryProvider.notifier)
        .getUltraShortTermForecast();

    return Future.value(
      HomeViewModelState(
        weather: weather,
      ),
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
    final previousState = state.asData!.value;

    state = AsyncData(
      previousState.copyWith(
        alarms: [...previousState.alarms, alarm],
      ),
    );
  }

  // void toggleAlarm(int index) {
  //   final previousState = state.asData!.value;
  //   var tempAlarm = previousState.alarms;

  //   for (var i = 0; i < tempAlarm.length; i++) {
  //     if (i == index) {
  //       tempAlarm[i] = tempAlarm[i].copyWith(
  //         isActivated: !tempAlarm[i].isActivated,
  //       );
  //     }
  //   }

  //   state = AsyncData(
  //     previousState.copyWith(
  //       alarms: tempAlarm,
  //     ),
  //   );
  // }
}
