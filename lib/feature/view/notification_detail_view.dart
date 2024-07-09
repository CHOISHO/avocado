import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/mapper/weather_data_mapper.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/feature/view_model/notification_detail_view_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';
import 'package:avocado/util/date.dart';

String getRainningIcon(WeatherType weatherType) {
  String icon;

  if (weatherType == WeatherType.rainningDrizzle) {
    icon = 'assets/icons/rainning_1_drizzle.svg';
  } else if (weatherType == WeatherType.rainningNormal) {
    icon = 'assets/icons/rainning_2.svg';
  } else if (weatherType == WeatherType.rainningHeavily) {
    icon = 'assets/icons/rainning_3_heavily.svg';
  } else if (weatherType == WeatherType.rainningDownpour) {
    icon = 'assets/icons/rainning_4_downpour.svg';
  } else {
    icon = 'assets/icons/rainning_1_drizzle.svg';
  }

  return icon;
}

Widget getDescriptionWidgetByRainningCount(
  BuildContext context, {
  required bool isOverRainningHeavily,
  required int rainningDisrtictCount,
  required int weatherDataRowCount,
}) {
  List<InlineSpan> description = [];
  String umbrellaDescription = '';

  if (isOverRainningHeavily) {
    umbrellaDescription = '오늘은 튼튼한 우산을 챙겨가세요';
  } else {
    umbrellaDescription = '오늘은 작은 우산을 챙겨가세요';
  }

  if (weatherDataRowCount > 1) {
    description = [
      const TextSpan(text: '설정한 지역 중에\n우산이 필요한 곳이'),
      TextSpan(
        text: ' $rainningDisrtictCount군데 ',
        style: TextStyle(
          color: AvocadoColors.main,
          fontWeight: FontWeight.w600,
        ),
      ),
      const TextSpan(text: '있어요.'),
      TextSpan(text: '\n$umbrellaDescription :D'),
    ];
  } else {
    description = [
      TextSpan(text: '설정한 지역에 우산이 필요해요.\n$umbrellaDescription :D')
    ];
  }

  return RichText(
    text: TextSpan(
      children: description,
      style: context.textThemeBodyMedium.copyWith(fontWeight: FontWeight.w500),
    ),
  );
}

String getPrecipitaionText(String value) {
  return value == '강수없음' ? '-' : value;
}

String getPrecipitaionTextWithUnit(String value) {
  return value == '강수없음' ? '0mm' : value;
}

String getPrecipitaionProbabilityText(String value) {
  int parsedValue = int.parse(value);

  return parsedValue == 0 ? '-' : '$parsedValue %';
}

class NotificationDetailView extends ConsumerStatefulWidget {
  const NotificationDetailView({super.key});

  @override
  ConsumerState<NotificationDetailView> createState() =>
      _NotificationDetailViewState();
}

class _NotificationDetailViewState
    extends ConsumerState<NotificationDetailView> {
  @override
  void initState() {
    super.initState();

    ref
        .read(notificationDetailViewModelProvider.notifier)
        .init('ApFw0UZw5O3R3fFmzfZF');
  }

  @override
  Widget build(BuildContext context) {
    var notificationDetailViewModel =
        ref.watch(notificationDetailViewModelProvider);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 48, left: 16),
            child: getDescriptionWidgetByRainningCount(
              context,
              isOverRainningHeavily:
                  notificationDetailViewModel.isOverRainningHeavily,
              rainningDisrtictCount:
                  notificationDetailViewModel.rainningDisrtictCount,
              weatherDataRowCount: notificationDetailViewModel.weather.length,
            ),
          ),
          ...List.generate(notificationDetailViewModel.weather.length, (i) {
            var data = notificationDetailViewModel.weather[i].data;

            return shadowCard(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notificationDetailViewModel.weather[i].district,
                          style: context.textThemeBodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          notificationDetailViewModel.weather[i].needUmbrella
                              ? '우산 필요'
                              : '',
                          style: context.textThemeBodyMedium.copyWith(
                            color: AvocadoColors.main,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  data != null
                      ? Column(
                          children: [
                            Table(
                              columnWidths: const {
                                0: FixedColumnWidth(60),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        '시간',
                                        style: context.textThemeLabelMedium
                                            .copyWith(
                                          color: AvocadoColors.grey03,
                                        ),
                                      ),
                                    ),
                                    ...List.generate(data.length, (int index) {
                                      return SizedBox(
                                        height: 25,
                                        child: Text(
                                          DateUtil.getHourWithAMPM(int.parse(
                                              data[index]
                                                  .time
                                                  .substring(0, 2))),
                                          textAlign: TextAlign.center,
                                          style: context.textThemeBodySmall
                                              .copyWith(
                                            color: AvocadoColors.grey01,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        '강수량',
                                        style: context.textThemeLabelMedium
                                            .copyWith(
                                          color: AvocadoColors.grey03,
                                        ),
                                      ),
                                    ),
                                    ...List.generate(data.length, (int index) {
                                      return SizedBox(
                                        height: 25,
                                        child: Text(
                                          checkIsRainning(data[index].type)
                                              ? data[index].type.label
                                              : '-',
                                          textAlign: TextAlign.center,
                                          style: context.textThemeBodySmall
                                              .copyWith(
                                            color: AvocadoColors.main,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    ...List.generate(data.length, (int index) {
                                      return SizedBox(
                                        height: 25,
                                        child: Text(
                                          '(${getPrecipitaionTextWithUnit(data[index].precipitationPerHour)})',
                                          textAlign: TextAlign.center,
                                          style: context.textThemeBodySmall
                                              .copyWith(
                                            color: AvocadoColors.grey02,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(),
                                    ...List.generate(data.length, (int index) {
                                      return checkIsRainning(data[index].type)
                                          ? SvgPicture.asset(
                                              getRainningIcon(
                                                data[index].type,
                                              ),
                                              width: 50,
                                            )
                                          : Container();
                                    }),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        '강수확률',
                                        style: context.textThemeLabelMedium
                                            .copyWith(
                                          color: AvocadoColors.grey03,
                                        ),
                                      ),
                                    ),
                                    ...List.generate(data.length, (int index) {
                                      return SizedBox(
                                        height: 25,
                                        child: Text(
                                          getPrecipitaionProbabilityText(
                                              data[index]
                                                  .precipitationProbability),
                                          textAlign: TextAlign.center,
                                          style: context.textThemeBodySmall
                                              .copyWith(
                                            color: AvocadoColors.grey02,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
