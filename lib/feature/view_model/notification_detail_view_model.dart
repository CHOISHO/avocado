import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/alarm_repository.dart';
import 'package:avocado/domain/mapper/weather_data_mapper.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/domain/model/weather_model.dart';

part 'notification_detail_view_model.freezed.dart';
part 'notification_detail_view_model.g.dart';

@freezed
class NotificationDetailViewModelState with _$NotificationDetailViewModelState {
  const factory NotificationDetailViewModelState({
    @Default(0) int rainningDisrtictCount,
    @Default(false) bool isOverRainningHeavily,
    @Default([]) List<AlarmWeatherModel> weather,
  }) = _NotificationDetailViewModelState;

  factory NotificationDetailViewModelState.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationDetailViewModelStateFromJson(json);
}

@riverpod
class NotificationDetailViewModel extends _$NotificationDetailViewModel {
  @override
  NotificationDetailViewModelState build() {
    return const NotificationDetailViewModelState();
  }

  Future init(String alarmId) async {
    var alarmWeatherList = await ref
        .read(alarmRepositoryProvider.notifier)
        .getAlarmDetail(alarmId);

    bool isOverRainningHeavily = false;
    int rainningDisrtictCount = 0;

    for (var weather in alarmWeatherList) {
      bool isRainning = false;

      if (weather.data != null) {
        for (var row in weather.data!) {
          isRainning = checkIsRainning(row.type) ? true : isRainning;

          if (row.type == WeatherType.rainningHeavily ||
              row.type == WeatherType.rainningDownpour) {
            isOverRainningHeavily = true;
          }
        }
      }

      if (isRainning) rainningDisrtictCount++;
    }

    state = state.copyWith(
      isOverRainningHeavily: isOverRainningHeavily,
      rainningDisrtictCount: rainningDisrtictCount,
      weather: alarmWeatherList,
    );
  }
}
