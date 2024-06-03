import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/alarm_repository.dart';
import 'package:avocado/domain/model/alarm_model.dart';

part 'alarm_view_model.g.dart';

@riverpod
class AlarmViewModel extends _$AlarmViewModel {
  @override
  List<AlarmModel> build() {
    return init();
  }

  List<AlarmModel> init() {
    return ref.watch(alarmRepositoryProvider);
  }

  void toggleAlarm(int index) {
    ref.read(alarmRepositoryProvider.notifier).toggleAlarm(index);
  }
}
