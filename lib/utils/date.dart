class DateUtil {
  static String getYYYYMMDDToday() {
    DateTime today = DateTime.now();
    String year = today.year.toString();
    String month = today.month.toString().padLeft(2, '0');
    String day = today.day.toString().padLeft(2, '0');

    return '$year$month$day';
  }
}
