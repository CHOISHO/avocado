import 'package:flutter_test/flutter_test.dart';

import 'package:avocado/util/date.dart';

void main() {
  // 단기예보 기준 시간
  // - Base_time: 0030, 0130, 0230 ~ 2130, 2230, 2330
  // - API 제공시간: 0045, 0145, 0245 ~ 2145, 2245, 2345
  group('getUltraShortTermForecastBaseDate', () {
    test('20240505 00시 29분에 기준 날짜 20240504를 반환한다.', () {
      expect(
        DateUtil.getUltraShortTermForecastBaseDate(DateTime(2024, 5, 5, 0, 2)),
        '20240504',
      );
    });

    test('20240505 00시 30분에 기준 날짜 20240505를 반환한다.', () {
      expect(
        DateUtil.getUltraShortTermForecastBaseDate(DateTime(2024, 5, 5, 0, 30)),
        '20240505',
      );
    });
  });

  group('getUltraShortTermForecastBaseTime', () {
    test('20240505 00시 29분에 기준 시간 2200을 반환한다.', () {
      expect(
        DateUtil.getUltraShortTermForecastBaseTime(DateTime(2024, 5, 5, 0, 2)),
        '2200',
      );
    });

    test('20240505 01시 30분에 기준 시간 2300을 반환한다.', () {
      expect(
        DateUtil.getUltraShortTermForecastBaseTime(DateTime(2024, 5, 5, 1, 30)),
        '2300',
      );
    });

    test('20240505 02시 00분에 기준 시간 0000을 반환한다.', () {
      expect(
        DateUtil.getUltraShortTermForecastBaseTime(DateTime(2024, 5, 5, 2, 0)),
        '0000',
      );
    });
  });

  // 단기예보 기준 시간
  // - Base_time: 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
  // - API 제공시간: 0210, 0510, 0810, 1110, 1410, 1710, 2010, 2310
  group('getShortTermForecastBaseTime_test', () {
    DateTime today = DateTime.now();
    int year = today.year;
    int month = today.month;
    int day = today.day;

    test('00시 30분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(
            DateTime(year, month, day, 0, 30)),
        '2300',
      );
    });

    test('00시 30분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(
            DateTime(year, month, day, 0, 30)),
        '2300',
      );
    });

    test('02시 09분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 2, 9)),
        '2300',
      );
    });

    test('02시 30분에 단기예보 기준시간 02시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(
            DateTime(year, month, day, 2, 30)),
        '0200',
      );
    });

    test('07시 09분에 단기예보 기준시간 05시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(DateTime(year, month, day, 7, 9)),
        '0500',
      );
    });

    test('23시 09분에 단기예보 기준시간 시 20시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(
            DateTime(year, month, day, 23, 9)),
        '2000',
      );
    });

    test('23시 30분에 단기예보 기준시간 23시 00분을 반환한다.', () {
      expect(
        DateUtil.getShortTermForecastBaseTime(
            DateTime(year, month, day, 23, 30)),
        '2300',
      );
    });
  });

  group('getHHColonMMWithAMPM', () {
    test('0 에 대해서 오전 00:00 을 반환한다.', () {
      expect(DateUtil.getHHColonMMWithAMPM(0), '오전 00:00');
    });

    test('12 에 대해서 오전 12:00 을 반환한다.', () {
      expect(DateUtil.getHHColonMMWithAMPM(12), '오후 12:00');
    });

    test('23 에 대해서 오후 23:00 을 반환한다.', () {
      expect(DateUtil.getHHColonMMWithAMPM(23), '오후 23:00');
    });
  });
}
