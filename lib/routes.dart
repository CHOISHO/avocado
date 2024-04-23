import 'package:flutter/material.dart';

import 'package:avocado/presentation/view/home.dart';

class RoutesName {
  static String home = '/home';
}

Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => const Home(),
};
