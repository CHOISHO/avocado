import 'package:flutter/material.dart';

import 'package:avocado/feature/view/add_alarm/add_alarm_view.dart';
import 'package:avocado/feature/view/home/home_view.dart';
import 'package:avocado/feature/view/permission_check_view/permission_check_view.dart';
import 'package:avocado/feature/view/search_district/search_district_view.dart';
import 'package:avocado/feature/view/splash/splash_view.dart';

class RoutesName {
  static String splash = '/splash';
  static String permissionCheck = '/permissionCheck';
  static String home = '/home';
  static String searchDistrict = '/searchDistrict';
  static String addAlarm = '/addAlarm';
}

Map<String, WidgetBuilder> routes = {
  RoutesName.splash: (context) => const SplashView(),
  RoutesName.permissionCheck: (context) => const PermissionCheckView(),
  RoutesName.home: (context) => const HomeView(),
  RoutesName.searchDistrict: (context) => SearchDistrictView(
        onSelected: (selectedDistrict) {},
      ),
  RoutesName.addAlarm: (context) => const AddAlarmView(),
};
