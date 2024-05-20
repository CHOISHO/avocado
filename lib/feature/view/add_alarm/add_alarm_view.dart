import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_district_modal_widget.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_period_widget.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_time_modal_widget.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_widget.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';
import 'package:avocado/util/date.dart';

class AddAlarmView extends ConsumerWidget {
  const AddAlarmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AlarmModel alarm = ref.watch(addAlarmViewModelProvider).alarm;

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            '취소',
            style: context.textThemeBody1.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        title: Center(
          child: Text(
            '알림 추가',
            style: context.textThemeBody1.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(addAlarmViewModelProvider.notifier).addAlarm();

              Navigator.pop(context);
            },
            child: Text(
              '저장',
              style: context.textThemeBody1.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '우산을 챙겨야 할 때,\n푸시 알림으로 알려드릴게요!',
              style:
                  context.textThemeBody1.copyWith(fontWeight: FontWeight.w500),
            ),
            SelectWidget(
              label: '시각',
              value:
                  alarm.time != null ? DateUtil.getHHColonMM(alarm.time!) : '',
              hintText: '알림 시각을 선택해 주세요.',
              onTap: () {
                showSelectTimeModalWidget(context);
              },
            ),
            SelectWidget(
              label: '지역 1',
              value: ref
                  .watch(addAlarmViewModelProvider)
                  .alarm
                  .district1
                  .streetNameAddress,
              hintText: '확인 지역을 선택해 주세요.',
              onTap: () {
                showSelectDistrictModalWidget(context, (selectedDistrict) {
                  ref
                      .read(addAlarmViewModelProvider.notifier)
                      .setDistrict1(selectedDistrict);
                });
              },
            ),
            SelectWidget(
              label: '지역 2',
              value: ref
                  .watch(addAlarmViewModelProvider)
                  .alarm
                  .district2
                  .streetNameAddress,
              hintText: '확인 지역을 선택해 주세요.',
              onTap: () {
                showSelectDistrictModalWidget(context, (selectedDistrict) {
                  ref
                      .read(addAlarmViewModelProvider.notifier)
                      .setDistrict2(selectedDistrict);
                });
              },
            ),
            SelectWidget(
              label: '지역 3',
              value: ref
                  .watch(addAlarmViewModelProvider)
                  .alarm
                  .district3
                  .streetNameAddress,
              hintText: '확인 지역을 선택해 주세요.',
              onTap: () {
                showSelectDistrictModalWidget(context, (selectedDistrict) {
                  ref
                      .read(addAlarmViewModelProvider.notifier)
                      .setDistrict3(selectedDistrict);
                });
              },
            ),
            const SelectPeriodWidget()
          ],
        ),
      ),
    );
  }
}
