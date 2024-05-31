import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/feature/view/home/private_widget/add_alarm_button_widget.dart';
import 'package:avocado/feature/view/home/private_widget/alarm_list_widget.dart';
import 'package:avocado/feature/view/home/private_widget/home_header_widget.dart';
import 'package:avocado/feature/view/home/private_widget/weather_card_widget.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AvocadoColors.grey05,
      floatingActionButton: const AddAlarmButtonWidget(),
      body: const Column(
        children: [
          HomeHeaderWidget(),
          WeatherCardWidget(),
          AlarmListWidget(),
        ],
      ),
    );
  }
}
