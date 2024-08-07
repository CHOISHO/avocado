class DateUtil {
  factory DateUtil() {
    return _instance;
  }

  DateUtil._internal();

  static final DateUtil _instance = DateUtil._internal();

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
    int calculatedHour;

    if (hour < 2) {
      calculatedHour = hour + 22; // INFO: 0시, 1시의 2시간 전인 22시,23시를 계산하기 위함
    } else {
      calculatedHour = hour - 2;
    }

    return '${calculatedHour.toString().padLeft(2, '0')}00';
  }

  static String getShortTermForecastBaseTime(DateTime date) {
    List<int> shortTermForecastBaseTimeList = [2, 5, 8, 11, 14, 17, 20, 23];

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

  static String getHHColonMM(int time) {
    return '${time.toString().padLeft(2, '0')}:00';
  }

  static String getHHColonMMWithAMPM(int time) {
    String AMPM;

    if (time >= 12) {
      AMPM = '오후';
    } else {
      AMPM = '오전';
    }
    return '$AMPM ${time.toString().padLeft(2, '0')}:00';
  }

  static String getHourWithAMPM(int time) {
    String AMPM;
    int hour;

    if (time >= 12) {
      AMPM = '오후';
      hour = time - 12;
    } else {
      AMPM = '오전';
      hour = time;
    }

    return '$AMPM $hour시';
  }

  static String getLocalTimeDate(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    int weekdayIndex = date.weekday;

    return '$year년 $month월 $day일 (${weekdays[weekdayIndex]})';
  }

  static String getLocalTimeDateWithoutWeekday(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');

    return '$year년 $month월 $day일';
  }
}

List<String> weekdays = ['월', '화', '수', '목', '금', '토', '일'];
