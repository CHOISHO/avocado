import 'package:flutter/material.dart';

class DateUtil {
  static String getYYYYMMDDToday() {
    DateTime today = DateTime.now();
    String year = today.year.toString();
    String month = today.month.toString().padLeft(2, '0');
    String day = today.day.toString().padLeft(2, '0');

    return '$year$month$day';
  }

  static String getBaseTime() {
    DateTime today = DateTime.now();
    String hour = (today.hour - 1).toString().padLeft(2, '0');
    int minute = today.minute;
    String parsedMinut;

    if (minute < 30) {
      parsedMinut = '00';
    } else {
      parsedMinut = '30';
    }

    return '$hour$parsedMinut';
  }
}
