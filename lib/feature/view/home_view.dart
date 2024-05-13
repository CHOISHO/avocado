import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/feature/view/private_widget/add_alarm_button.dart';
import 'package:avocado/feature/view/private_widget/weather_card.dart';
import 'package:avocado/feature/view_model/home_view_model.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<HomeViewModelState> data = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: AvocadoColors.grey05,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SvgPicture.asset(
                      'assets/icons/Logo.svg',
                      key: const Key('logo'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/setting.svg'),
                  )
                ],
              ),
            ),
          ),
          data.when(
            data: (value) => WeatherCard(value: value.weather),
            error: (e, st) => const Text('Oops, something unexpected happened'),
            loading: () => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const Expanded(
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
                    AddAlarmButton(),
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
