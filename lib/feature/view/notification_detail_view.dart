import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/mapper/weather_data_mapper.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';
import 'package:avocado/util/date.dart';

// TODO: API 데이터 연결
List<Map<String, dynamic>> weather = [
  {
    "district": "충청북도 충주시 칠금동",
    "data": [
      {
        "windSpeedToEastWest": "5.9",
        "sky": "4",
        "precipitationProbability": "60",
        "windSpeedToSouthNorth": "-0.7",
        "huminity": "90",
        "snowPerHour": "적설없음",
        "type": "rainningDrizzle",
        "wave": "0",
        "temperaturePerHour": "26",
        "precipitationType": "1",
        "precipitationPerHour": "1.0mm",
        "time": "1600",
        "windDirection": "277",
        "windSpeed": "5.9"
      },
      {
        "windSpeedToEastWest": "1.2",
        "sky": "4",
        "precipitationProbability": "60",
        "windSpeedToSouthNorth": "1",
        "huminity": "90",
        "snowPerHour": "적설없음",
        "type": "rainningDrizzle",
        "wave": "0",
        "temperaturePerHour": "26",
        "precipitationType": "1",
        "precipitationPerHour": "2.0mm",
        "time": "1800",
        "windDirection": "230",
        "windSpeed": "1.6"
      },
      {
        "windSpeedToEastWest": "1.3",
        "sky": "4",
        "precipitationProbability": "60",
        "windSpeedToSouthNorth": "1.2",
        "huminity": "95",
        "snowPerHour": "적설없음",
        "type": "rainningNormal",
        "wave": "0",
        "temperaturePerHour": "25",
        "precipitationType": "1",
        "precipitationPerHour": "3.0mm",
        "time": "2000",
        "windDirection": "227",
        "windSpeed": "1.8"
      }
    ]
  },
  {
    "district": "서울특별시 도봉구 도봉동",
    "data": [
      {
        "windSpeedToEastWest": "1",
        "sky": "4",
        "precipitationProbability": "60",
        "windSpeedToSouthNorth": "0.5",
        "huminity": "80",
        "snowPerHour": "적설없음",
        "type": "rainningDrizzle",
        "wave": "0",
        "temperaturePerHour": "26",
        "precipitationType": "1",
        "precipitationPerHour": "1mm 미만",
        "time": "1600",
        "windDirection": "243",
        "windSpeed": "1.1"
      },
      {
        "windSpeedToEastWest": "1.2",
        "sky": "4",
        "precipitationProbability": "30",
        "windSpeedToSouthNorth": "1.5",
        "huminity": "85",
        "snowPerHour": "적설없음",
        "type": "cloudyNormal",
        "wave": "0",
        "temperaturePerHour": "26",
        "precipitationType": "0",
        "precipitationPerHour": "강수없음",
        "time": "1800",
        "windDirection": "219",
        "windSpeed": "1.9"
      },
      {
        "windSpeedToEastWest": "0.6",
        "sky": "4",
        "precipitationProbability": "60",
        "windSpeedToSouthNorth": "1.2",
        "huminity": "85",
        "snowPerHour": "적설없음",
        "type": "rainningNormal",
        "wave": "0",
        "temperaturePerHour": "25",
        "precipitationType": "1",
        "precipitationPerHour": "8.0mm",
        "time": "2000",
        "windDirection": "207",
        "windSpeed": "1.3"
      }
    ]
  }
];

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

class NotificationDetailView extends StatelessWidget {
  const NotificationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: 파서 분리
    var parsed = weather.map((item) {
      var parsedData = [];
      bool needUmbrella = false;

      for (var i in item['data']) {
        var data = Weather.fromJson(i);
        needUmbrella = checkIsRainning(data.type);

        parsedData.add(data);
      }

      return {
        ...item,
        'needUmbrella': needUmbrella,
        'data': parsedData,
      };
    }).toList();

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 48, left: 16),
            child: Text(
              '설정한 지역에 우산이 필요해요.\n오늘은 튼튼한 우산을 챙겨가세요 :D', // TODO: 비오는 날 체크 후 텍스트 수정
              style: context.textThemeBodyMedium
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          ...List.generate(parsed.length, (i) {
            var data = parsed[i]['data'];

            return shadowCard(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          parsed[i]['district'],
                          style: context.textThemeBodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          parsed[i]['needUmbrella'] ? '우산 필요' : '',
                          style: context.textThemeBodyMedium.copyWith(
                            color: AvocadoColors.main,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
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
                                  style: context.textThemeLabelMedium.copyWith(
                                    color: AvocadoColors.grey03,
                                  ),
                                ),
                              ),
                              ...List.generate(data.length, (int index) {
                                return SizedBox(
                                  height: 25,
                                  child: Text(
                                    DateUtil.getHourWithAMPM(int.parse(
                                        data[index].time.substring(0, 2))),
                                    textAlign: TextAlign.center,
                                    style: context.textThemeBodySmall.copyWith(
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
                                  style: context.textThemeLabelMedium.copyWith(
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
                                    style: context.textThemeBodySmall.copyWith(
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
                                    style: context.textThemeBodySmall.copyWith(
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
                                  style: context.textThemeLabelMedium.copyWith(
                                    color: AvocadoColors.grey03,
                                  ),
                                ),
                              ),
                              ...List.generate(data.length, (int index) {
                                return SizedBox(
                                  height: 25,
                                  child: Text(
                                    getPrecipitaionProbabilityText(
                                        data[index].precipitationProbability),
                                    textAlign: TextAlign.center,
                                    style: context.textThemeBodySmall.copyWith(
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
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
