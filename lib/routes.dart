import 'package:flutter/material.dart';

import 'package:avocado/feature/view/home/home_view.dart';

class RoutesName {
  static String home = '/home';
}

Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => const HomeView(),
};
