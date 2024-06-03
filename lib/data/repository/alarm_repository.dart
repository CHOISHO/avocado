import 'dart:convert';

import 'package:logger/logger.dart';

import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/util/shared_preferences.dart';

class AlarmRepository {
  factory AlarmRepository() {
    return _instance;
  }

  AlarmRepository._internal();

  static final AlarmRepository _instance = AlarmRepository._internal();

  Future<void> addAlarm(AlarmModel alarm) async {
    try {
      List<String> alarms =
          SharedPreferencesUtil().getStringList('alarms')?.toList() ?? [];

      await SharedPreferencesUtil()
          .setStringList('alarms', [...alarms, jsonEncode(alarm.toJson())]);
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

  Future<void> updateAlarm(List<AlarmModel> alarms) async {
    List<String> jsonifiedAlarms =
        alarms.map((alarm) => jsonEncode(alarm.toJson())).toList();

    await SharedPreferencesUtil().setStringList('alarms', jsonifiedAlarms);
  }
}
