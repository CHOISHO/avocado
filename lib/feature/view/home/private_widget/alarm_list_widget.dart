import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/feature/view_model/home_view_model.dart';
import 'package:avocado/feature/widget/shadow_card.dart';
import 'package:avocado/util/date.dart';

class AlarmListWidget extends ConsumerWidget {
  const AlarmListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(homeViewModelProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        data.when(
          data: (data) => data.alarms.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '알림',
                    style: context.textThemeTitle2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Container(),
          error: (Object error, StackTrace stackTrace) {
            return Container();
          },
          loading: () => Container(),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height - 335,
          child: data.when(
            data: (value) {
              return ListView.builder(
                itemCount: value.alarms.length,
                padding: const EdgeInsets.only(top: 0, bottom: 60),
                itemBuilder: (context, index) {
                  var alarm = value.alarms[index];
                  return AlarmCardWidget(
                    alarm: alarm,
                    onToggleAlarm: () {
                      ref
                          .read(homeViewModelProvider.notifier)
                          .toggleAlarm(index);
                    },
                  );
                },
              );
            },
            error: (e, st) => const Center(
              child: Text('Oops, something unexpected happened'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        data.when(
          data: (data) => data.alarms.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      '설정된 알림이 없어요\n우산 챙김 알림을 추가해 보세요 :D',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container(),
          error: (Object error, StackTrace stackTrace) {
            return Container();
          },
          loading: () => Container(),
        ),
      ],
    );
  }
}

class AlarmCardWidget extends StatelessWidget {
  const AlarmCardWidget({
    super.key,
    required this.alarm,
    required this.onToggleAlarm,
  });

  final AlarmModel alarm;
  final Function onToggleAlarm;

  @override
  Widget build(BuildContext context) {
    return shadowCard(
      SizedBox(
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
                      '${alarm.period.label} ',
                      style: context.textThemeBody1
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      alarm.time != null
                          ? DateUtil.getHHColonMMWithAMPM(alarm.time!)
                          : '',
                      style: context.textThemeBody1.copyWith(
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
                      style: context.textThemeBody1
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      alarm.district2?.thoroughfare != null
                          ? ', ${alarm.district2?.thoroughfare}'
                          : '',
                      style: context.textThemeBody1
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      alarm.district3?.thoroughfare != null
                          ? ', ${alarm.district3?.thoroughfare}'
                          : '',
                      style: context.textThemeBody1
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '에',
                      style: context.textThemeBody1
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  '비가 오면 알려줄게요.',
                  style: context.textThemeBody1.copyWith(
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
      ),
    );
  }
}
