import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';

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
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 6)),
                  backgroundColor: MaterialStatePropertyAll(AvocadoColors.main),
                  minimumSize: const MaterialStatePropertyAll(Size(132, 26)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${value.district.administrativeArea}, ${value.district.subLocality} ${value.district.thoroughfare}',
                      style: context.textThemeLabel
                          .copyWith(color: AvocadoColors.white),
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
                weatherCardContent[value.type]!.label,
                style: context.textThemeTitle1
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                weatherCardContent[value.type]!.description,
                style: context.textThemeBody2
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SvgPicture.asset(weatherCardContent[value.type]!.icon)
        ],
      ),
    );
  }
}

class WeatherCardContentValue {
  String label;
  String icon;
  String description;
  WeatherCardContentValue(
      {required this.label, required this.icon, required this.description});
}

Map<WeatherType, WeatherCardContentValue> weatherCardContent = {
  WeatherType.sunny: WeatherCardContentValue(
    label: '맑음',
    icon: 'assets/icons/sunny.svg',
    description: '오늘은 우산을 챙기지 않아도 좋아요.',
  ),
  WeatherType.cloudyPartly: WeatherCardContentValue(
    label: '구름 많음',
    icon: 'assets/icons/cloudy_partly.svg',
    description: '오늘은 우산을 챙기지 않아도 좋아요.',
  ),
  WeatherType.cloudyNormal: WeatherCardContentValue(
    label: '흐림',
    icon: 'assets/icons/cloudy.svg',
    description: '오늘은 우산을 챙기지 않아도 좋아요.',
  ),
  WeatherType.rainningDrizzle: WeatherCardContentValue(
    label: '약한 비',
    icon: 'assets/icons/rainning_1_drizzle.svg',
    description: '오늘은 작은 우산을 챙기세요 :D',
  ),
  WeatherType.rainningNormal: WeatherCardContentValue(
    label: '보통 비',
    icon: 'assets/icons/rainning_2.svg',
    description: '오늘은 우산을 챙기세요 :D',
  ),
  WeatherType.rainningHeavily: WeatherCardContentValue(
    label: '강한 비',
    icon: 'assets/icons/rainning_3_heavily.svg',
    description: '오늘은 튼튼한 우산을 챙기세요 :D',
  ),
  WeatherType.rainningDownpour: WeatherCardContentValue(
    label: '폭우',
    icon: 'assets/icons/rainning_4_downpour.svg',
    description: '오늘은 튼튼한 우산을 챙기세요 :D',
  ),
};
