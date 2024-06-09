import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/domain/mapper/add_alarm_mapper.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/util/api.dart';
import 'package:avocado/util/shared_preferences.dart';

part 'alarm_repository.g.dart';

@riverpod
class AlarmRepository extends _$AlarmRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

  @override
  Future<List<AlarmModel>> build() async {
    return init();
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    try {
      state = const AsyncValue.loading();
      List<AlarmModel> newAlarms = [...state.value ?? [], alarm];

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

  Future<List<AlarmModel>> init() async {
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
        int districtsLength = data['districts'].length;

        if (districtsLength == 1) {
          alarm = alarm.copyWith(
            district1: District.fromJson(data['districts'][0]),
          );
        }

        if (districtsLength == 2) {
          alarm = alarm.copyWith(
            district2: District.fromJson(data['districts'][1]),
          );
        }

        if (districtsLength == 3) {
          alarm = alarm.copyWith(
            district3: District.fromJson(data['districts'][2]),
          );
        }

        alarms.add(alarm);
      }

      return alarms;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  void editAlarm(int index, AlarmModel editedAlarm) {
    List<AlarmModel> newAlarms = [...state.value ?? []];

    newAlarms[index] = editedAlarm;

    updateAlarm(newAlarms);
  }

  void toggleAlarm(int index) {
    List<AlarmModel> newAlarms = [...state.value ?? []];

    newAlarms[index] =
        newAlarms[index].copyWith(isActivated: !newAlarms[index].isActivated);

    updateAlarm(newAlarms);
  }

  void removeAlarm(int index) {
    List<AlarmModel> newAlarms = [...state.value ?? []];

    newAlarms.removeAt(index);

    updateAlarm(newAlarms).then((_) {
      state = AsyncValue.data(newAlarms);
    }).catchError((error) {
      state = AsyncValue.error(error, StackTrace.current);
    });
  }

  Future<void> updateAlarm(List<AlarmModel> newAlarms) async {
    state = const AsyncValue.loading();
    try {
      List<String> jsonifiedAlarms =
          newAlarms.map((alarm) => jsonEncode(alarm.toJson())).toList();

      await SharedPreferencesUtil().setStringList('alarms', jsonifiedAlarms);

      state = AsyncValue.data(newAlarms);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
      Logger().e(error);
    }
  }
}
