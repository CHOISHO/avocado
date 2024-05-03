import 'package:flutter_test/flutter_test.dart';

import 'package:avocado/util/date.dart';

void main() {
  // 단기예보 기준 시간
  // - Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
  group('getShortTermForecastBaseTime_test', () {
    DateTime today = DateTime.now();
    int year = today.year;
    int month = today.month;
    int day = today.day;

    test('00시 30분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 0, 30)), '2300');
    });

    test('00시 30분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 0, 30)), '2300');
    });

    test('02시 09분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 2, 9)), '2300');
    });

    test('02시 30분에 단기예보 기준시간 02시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 2, 30)), '0200');
    });

    test('07시 09분에 단기예보 기준시간 05시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 7, 9)), '0500');
    });

    test('23시 09분에 단기예보 기준시간 시 20시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 23, 9)), '2000');
    });

    test('23시 30분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 23, 30)), '2300');
    });
  });
}
