import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/domain/mapper/get_alarm_detail_mapper.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/util/api.dart';

part 'alarm_repository.g.dart';

@riverpod
class AlarmRepository extends _$AlarmRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

  @override
  List<AlarmModel>? build() {
    return null;
  }

  Future<void> init() async {
    try {
      var userState = ref.read(userRepositoryProvider);

      var response = await ApiUtil.get(
        url: _url,
        path: '/alarm/getUserAlarms',
        token: userState.idToken,
      );

      List<AlarmModel> alarms = [];

      for (var i = 0; i < response['alarms'].length; i++) {
        var data = response['alarms'][i];

        AlarmModel alarm = AlarmModel.fromJson(data);

        alarms.add(alarm);
      }

      state = alarms;
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    try {
      List<AlarmModel> newAlarms = [...state ?? [], alarm];

      var userState = ref.read(userRepositoryProvider);

      await ApiUtil.post(
        url: _url,
        path: '/alarm/create',
        body: {
          'alarm': alarm.toJson(),
        },
        token: userState.idToken,
      );

      state = newAlarms;
    } catch (error) {
      Logger().e(error);
    }
  }

  Future<void> editAlarm(int index, AlarmModel editedAlarm) async {
    try {
      List<AlarmModel> newAlarms = [...state ?? []];

      newAlarms[index] = editedAlarm;

      state = newAlarms;

      var userState = ref.read(userRepositoryProvider);

      await ApiUtil.post(
        url: _url,
        path: '/alarm/update',
        body: {
          'alarm': editedAlarm.toJson(),
        },
        token: userState.idToken,
      );
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> toggleAlarm(int index) async {
    try {
      List<AlarmModel> newAlarms = [...state ?? []];

      newAlarms[index] =
          newAlarms[index].copyWith(isActivated: !newAlarms[index].isActivated);

      state = newAlarms;

      var toggledAlarm = newAlarms[index].copyWith();

      var userState = ref.read(userRepositoryProvider);

      await ApiUtil.post(
        url: _url,
        path: '/alarm/update',
        body: {
          'alarm': toggledAlarm.toJson(),
        },
        token: userState.idToken,
      );
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> removeAlarm(int index) async {
    try {
      List<AlarmModel> newAlarms = [...state ?? []];

      var deletedAlarm = newAlarms[index].copyWith();

      newAlarms.removeAt(index);

      state = newAlarms;

      var userState = ref.read(userRepositoryProvider);

      await ApiUtil.post(
        url: _url,
        path: '/alarm/delete',
        body: {
          "alarmId": deletedAlarm.id,
        },
        token: userState.idToken,
      );
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> updateAlarm(List<AlarmModel> newAlarms) async {
    state = newAlarms;
  }

  Future<List<AlarmWeatherModel>> getAlarmDetail(String alarmId) async {
    try {
      var userState = ref.read(userRepositoryProvider);

      var response = await ApiUtil.post(
        url: _url,
        path: '/alarm/getNotificationDetail',
        body: {
          "alarmId": alarmId,
        },
        token: userState.idToken,
      );

      List<AlarmWeatherModel> alarmWeatherList = getAlarmDetailMapper(response);

      return alarmWeatherList;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
