import 'package:avocado/domain/model/alarm_model.dart';

Map<String, dynamic> addAlarmMapper(AlarmModel alarm) {
  var result = {
    'time': alarm.time,
    'period': alarm.period.value,
    'customPeriod': alarm.customPeriod,
  };

  List<Map<String, String>> districts = [];

  if (alarm.district1 != null) {
    districts.add({
      'krAddress': alarm.district1!.streetNameAddress,
      'krJibunAddress': alarm.district1!.streetAddress,
      'enAddress': alarm.district1!.englishStreetNameAddress,
    });
  }

  if (alarm.district2 != null) {
    districts.add({
      'krAddress': alarm.district2!.streetNameAddress,
      'krJibunAddress': alarm.district2!.streetAddress,
      'enAddress': alarm.district2!.englishStreetNameAddress,
    });
  }

  if (alarm.district3 != null) {
    districts.add({
      'krAddress': alarm.district3!.streetNameAddress,
      'krJibunAddress': alarm.district3!.streetAddress,
      'enAddress': alarm.district3!.englishStreetNameAddress,
    });
  }

  result['districts'] = districts;

  return result;
}
