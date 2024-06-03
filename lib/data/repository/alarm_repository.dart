import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'alarm_repository.g.dart';

@riverpod
class AlarmRepository extends _$AlarmRepository {
  @override
  List<AlarmModel> build() {
    return init();
  }

  List<AlarmModel> init() {
    List<String> alarms =
        SharedPreferencesUtil().getStringList('alarms')?.toList() ?? [];

    var parsedAlarms =
        alarms.map((e) => AlarmModel.fromJson(jsonDecode(e))).toList();

    return parsedAlarms;
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    try {
      var newAlarms = [...state, alarm];

      updateAlarm(newAlarms);
    } catch (error) {
      Logger().e(error);
    }
  }

  List<AlarmModel> getAlarms() {
    List<String> alarms =
        SharedPreferencesUtil().getStringList('alarms')?.toList() ?? [];

    var parsedAlarms =
        alarms.map((e) => AlarmModel.fromJson(jsonDecode(e))).toList();

    return parsedAlarms;
  }

  void editAlarm(int index, AlarmModel editedAlarm) {
    // TODO: server update
    final newAlarms = [...state];

    newAlarms[index] = editedAlarm;

    updateAlarm(newAlarms);
  }

  void toggleAlarm(int index) {
    final newAlarms = [...state];

    newAlarms[index] =
        newAlarms[index].copyWith(isActivated: !newAlarms[index].isActivated);

    updateAlarm(newAlarms);
  }

  void removeAlarm(int index) {
    // TODO: server update
    final newAlarms = [...state];

    newAlarms.removeAt(index);

    updateAlarm(newAlarms);
  }

  Future<void> updateAlarm(List<AlarmModel> newAlarms) async {
    state = newAlarms;

    List<String> jsonifiedAlarms =
        newAlarms.map((alarm) => jsonEncode(alarm.toJson())).toList();

    await SharedPreferencesUtil().setStringList('alarms', jsonifiedAlarms);
  }
}
