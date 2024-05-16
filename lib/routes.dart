import 'package:flutter/material.dart';

import 'package:avocado/feature/view/add_alarm/add_alarm_view.dart';
import 'package:avocado/feature/view/home/home_view.dart';
import 'package:avocado/feature/view/search_district/search_district_view.dart';

class RoutesName {
  static String home = '/home';
  static String searchDistrict = '/searchDistrict';
  static String addAlarm = '/addAlarm';
}

Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => const HomeView(),
  RoutesName.searchDistrict: (context) => const SearchDistrictView(),
  RoutesName.addAlarm: (context) => const AddAlarmView(),
};
