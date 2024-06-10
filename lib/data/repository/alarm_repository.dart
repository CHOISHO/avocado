import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/util/api.dart';

part 'alarm_repository.g.dart';

@riverpod
class AlarmRepository extends _$AlarmRepository {
  final String _url = 'bioni-avocado.firebaseapp.com';

  @override
  List<AlarmModel>? build() {
    init();
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
      // return alarms;
    } catch (e) {
      Logger().e(e);
      // return [];
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

  void editAlarm(int index, AlarmModel editedAlarm) {
    List<AlarmModel> newAlarms = [...state ?? []];

    newAlarms[index] = editedAlarm;

    state = newAlarms;
  }

  void toggleAlarm(int index) {
    List<AlarmModel> newAlarms = [...state ?? []];

    newAlarms[index] =
        newAlarms[index].copyWith(isActivated: !newAlarms[index].isActivated);

    state = newAlarms;
  }

  void removeAlarm(int index) {
    List<AlarmModel> newAlarms = [...state ?? []];

    newAlarms.removeAt(index);

    state = newAlarms;
  }

  Future<void> updateAlarm(List<AlarmModel> newAlarms) async {
    state = newAlarms;
  }
}
