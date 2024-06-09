import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/feature/view/add_alarm/add_alarm_view.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';
import 'package:avocado/feature/view_model/alarm_view_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';
import 'package:avocado/util/date.dart';

class AlarmListWidget extends ConsumerWidget {
  const AlarmListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var alarms = ref.watch(alarmViewModelProvider);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 280,
      child: alarms != null
          ? alarms.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        '알림',
                        style: context.textThemeTitleSmall.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: alarms.length,
                          padding: const EdgeInsets.only(top: 0, bottom: 60),
                          itemBuilder: (context, index) {
                            var alarm = alarms[index];

                            return AlarmCardWidget(
                              alarm: alarm,
                              onTapCard: () {
                                ref
                                    .read(addAlarmViewModelProvider.notifier)
                                    .init(index, alarm);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddAlarmView(),
                                ));
                              },
                              onToggleAlarm: () {
                                ref
                                    .read(alarmViewModelProvider.notifier)
                                    .toggleAlarm(index);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      '설정된 알림이 없어요\n우산 챙김 알림을 추가해 보세요 :D',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class AlarmCardWidget extends StatelessWidget {
  const AlarmCardWidget({
    super.key,
    required this.alarm,
    required this.onTapCard,
    required this.onToggleAlarm,
  });

  final AlarmModel alarm;
  final Function onTapCard;
  final Function onToggleAlarm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCard();
      },
      child: shadowCard(SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      alarm.period == AlarmPeriodType.custom &&
                              alarm.customPeriod != null
                          ? '${DateUtil.getLocalTimeDateWithoutWeekday(alarm.customPeriod!)} '
                          : '${alarm.period.label} ',
                      style: context.textThemeBodyMedium
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      alarm.time != null
                          ? DateUtil.getHHColonMMWithAMPM(alarm.time!)
                          : '',
                      style: context.textThemeBodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AvocadoColors.main,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      alarm.district1?.thoroughfare != null
                          ? '${alarm.district1?.thoroughfare}'
                          : '',
                      style: context.textThemeBodyMedium
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      alarm.district2?.thoroughfare != null
                          ? ', ${alarm.district2?.thoroughfare}'
                          : '',
                      style: context.textThemeBodyMedium
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      alarm.district3?.thoroughfare != null
                          ? ', ${alarm.district3?.thoroughfare}'
                          : '',
                      style: context.textThemeBodyMedium
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '에',
                      style: context.textThemeBodyMedium
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  '비가 오면 알려줄게요.',
                  style: context.textThemeBodyMedium.copyWith(
                    color: AvocadoColors.grey02,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              child: Switch(
                value: alarm.isActivated,
                activeColor: AvocadoColors.main,
                thumbColor: MaterialStatePropertyAll(AvocadoColors.white),
                activeTrackColor: AvocadoColors.main,
                inactiveTrackColor: AvocadoColors.grey04,
                onChanged: (value) {
                  onToggleAlarm();
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
