import 'package:avocado/presentation/view/home.dart';
import 'package:flutter/material.dart';

class RoutesName {
  static String home = '/home';
}

Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => const Home(),
};
