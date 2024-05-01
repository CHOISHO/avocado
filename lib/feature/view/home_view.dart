import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/feature/view_model/home_view_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          print('TAP');
                        },
                        child: SvgPicture.asset(
                          'assets/icons/setting.svg',
                          key: const Key('setting_icon'),
                        )),
                  )
                ],
              ),
            ),
          ),
          switch (data) {
            AsyncData<HomeViewModelState>(:final value) => WeatherCard(value: value.weather),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const Expanded(child: Center(child: CircularProgressIndicator())),
          },
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Weather value;
  const WeatherCard({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return shadowCard(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AvocadoColors.main),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${value.district.administrativeArea}, ${value.district.subLocality} ${value.district.thoroughfare}',
                      style: TextStyle(color: AvocadoColors.white),
                    ),
                    SvgPicture.asset(
                      'assets/icons/arrow_right.svg',
                      key: const Key('arrow_right_icon'),
                    )
                  ],
                ),
              ),
              Text(value.precipitation),
              Text('오늘은 튼튼한 우산을 챙기세요 :D'),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/rainning.svg',
            key: const Key('rainning_icon'),
          )
        ],
      ),
    );
  }
}
