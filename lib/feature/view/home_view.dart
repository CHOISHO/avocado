import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
                  backgroundColor: MaterialStatePropertyAll(AvocadoColors.main),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${value.district.administrativeArea}, ${value.district.subLocality} ${value.district.thoroughfare}',
                      style: context.themeLabel.copyWith(color: AvocadoColors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        height: 13,
                        key: const Key('arrow_right_icon'),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                value.precipitation,
                style: context.themeTitle1.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '오늘은 튼튼한 우산을 챙기세요 :D',
                style: context.themeBody2,
              ),
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
