import 'package:avocado/domain/mapper/weather_data_mapper.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/domain/model/weather_model.dart';

List<AlarmWeatherModel> getAlarmDetailMapper(Map<String, dynamic> data) {
  try {
    var weather = data['weather'];

    List<AlarmWeatherModel> alarmWeatherList = [];

    for (var item in weather) {
      List<Weather> parsedData = [];
      bool needUmbrella = false;

      for (var i in item['data']) {
        Weather data = Weather.fromJson(i);
        needUmbrella = checkIsRainning(data.type);

        parsedData.add(data);
      }

      alarmWeatherList.add(
        AlarmWeatherModel(
          district: item['district'],
          data: parsedData,
          needUmbrella: needUmbrella,
        ),
      );
    }

    return alarmWeatherList;
  } catch (e) {
    rethrow;
  }
}
