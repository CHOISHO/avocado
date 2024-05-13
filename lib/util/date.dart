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

    // TODO: 현재 시간 기준 최적의 BaseTime 로직 검증 필요

    // int minute = date.minute;

    // if (minute < 30) {
    //   ultraShortTermForecastBaseTime = '${(hour - 1)}30';
    // } else {
    //   ultraShortTermForecastBaseTime = '${hour}30';
    // }

    // INFO: 현재 시간 30분에 기상청 서버에서 데이터가 준비되지 않아 현재시간 2시간 전 기준으로 BaseTime 반환
    return '${(hour - 2)}00';
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
      shortTermForecastBaseTime =
          filteredBaseTimeList[filteredBaseTimeList.length - 1];
      bool isNotReadyForForcastServer =
          shortTermForecastBaseTime == hour && minute < 10;

      if (isNotReadyForForcastServer) {
        if (shortTermForecastBaseTime == 2) {
          shortTermForecastBaseTime = 23;
        } else {
          shortTermForecastBaseTime =
              filteredBaseTimeList[filteredBaseTimeList.length - 2];
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
