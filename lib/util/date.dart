class DateUtil {
  static String getYYYYMMDD(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');

    return '$year$month$day';
  }

  static String getUltraShortTermLiveBaseTime(DateTime date) {
    return '';
  }

  static String getUltraShortTermForecastBaseDate(DateTime date) {
    if (date.hour == 0 && date.minute < 30) {
      return getYYYYMMDD(date.subtract(const Duration(days: 1)));
    } else {
      return getYYYYMMDD(date);
    }
  }

  static String getUltraShortTermForecastBaseTime(DateTime date) {
    int hour = date.hour;
    int minute = date.minute;

    String ultraShortTermForecastBaseTime;

    if (minute < 30) {
      ultraShortTermForecastBaseTime = '${(hour - 1)}00';
    } else {
      ultraShortTermForecastBaseTime = '${hour}00';
    }

    return ultraShortTermForecastBaseTime;
  }

  static String getShortTermForecastBaseTime(DateTime date) {
    int hour = date.hour;

    int minute = date.minute;

    List<int> filteredBaseTimeList = [];

    for (var baseTime in shortTermForecastBaseTimeList) {
      if (baseTime <= hour) {
        filteredBaseTimeList.add(baseTime);
      }
    }

    int shortTermForecastBaseTime;

    if (filteredBaseTimeList.isEmpty) {
      shortTermForecastBaseTime = 23;
    } else {
      shortTermForecastBaseTime = filteredBaseTimeList[filteredBaseTimeList.length - 1];
      bool isNotReadyForForcastServer = shortTermForecastBaseTime == hour && minute < 10;

      if (isNotReadyForForcastServer) {
        if (shortTermForecastBaseTime == 2) {
          shortTermForecastBaseTime = 23;
        } else {
          shortTermForecastBaseTime = filteredBaseTimeList[filteredBaseTimeList.length - 2];
        }
      }
    }

    return '${shortTermForecastBaseTime.toString().padLeft(2, '0')}00';
  }

  static String getShortTermForecastBaseDate(DateTime date) {
    if (date.hour < 2 || (date.hour == 2 && date.minute < 10)) {
      return getYYYYMMDD(date.subtract(const Duration(days: 1)));
    } else {
      return getYYYYMMDD(date);
    }
  }
}

List<int> shortTermForecastBaseTimeList = [2, 5, 8, 11, 14, 17, 20, 23];
