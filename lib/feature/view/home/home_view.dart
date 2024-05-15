import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/feature/view/home/private_widget/add_alarm_button_widget.dart';
import 'package:avocado/feature/view/home/private_widget/home_header_widget.dart';
import 'package:avocado/feature/view/home/private_widget/weather_card_widget.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AvocadoColors.grey05,
      body: const Column(
        children: [
          HomeHeaderWidget(),
          WeatherCardWidget(),
          Expanded(
            child: Stack(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    '설정된 알림이 없어요\n우산 챙김 알림을 추가해 보세요 :D',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddAlarmButtonWidget(),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
