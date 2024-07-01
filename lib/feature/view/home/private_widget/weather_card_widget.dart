import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_district_modal_widget.dart';
import 'package:avocado/feature/view_model/home_view_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';

class WeatherCardWidget extends ConsumerWidget {
  const WeatherCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(homeViewModelProvider);

    return shadowCard(
      child: SizedBox(
        height: 105,
        child: state.weather != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6)),
                          backgroundColor:
                              WidgetStatePropertyAll(AvocadoColors.main),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(132, 26)),
                        ),
                        onPressed: () {
                          showSelectDistrictModalWidget(
                            context,
                            (selectedDistrict) => ref
                                .read(homeViewModelProvider.notifier)
                                .setDistrict(
                                  selectedDistrict.englishStreetNameAddress,
                                ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.weather!.district.administrativeArea}, ${state.weather!.district.subLocality} ${state.weather!.district.thoroughfare}',
                              style: context.textThemeLabelMedium
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
                      weatherCardContent[state.weather!.type] != null
                          ? Text(
                              weatherCardContent[state.weather!.type]!.label,
                              style: context.textThemeTitleMedium
                                  .copyWith(fontWeight: FontWeight.w600),
                            )
                          : Container(),
                      weatherCardContent[state.weather!.type] != null
                          ? Text(
                              weatherCardContent[state.weather!.type]!
                                  .description,
                              style: context.textThemeBodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            )
                          : Container(),
                    ],
                  ),
                  weatherCardContent[state.weather!.type] != null
                      ? SvgPicture.asset(
                          weatherCardContent[state.weather!.type]!.icon)
                      : Container()
                ],
              )
            : Container(),
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
