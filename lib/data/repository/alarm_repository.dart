import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/domain/mapper/add_alarm_mapper.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/util/api.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'alarm_repository.g.dart';

@riverpod
class AlarmRepository extends _$AlarmRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

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

      var userState = ref.read(userRepositoryProvider);

      await ApiUtil.post(
        url: _url,
        path: '/alarm/add',
        body: {
          'alarm': addAlarmMapper(alarm),
        },
        token: userState.idToken,
      );

      updateAlarm(newAlarms);

      // TODO: 알림 리스트 서버에서 관리 하도록 수정
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
