import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/remove_alarm_remind_popup_widget.dart';
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
    var state = ref.watch(addAlarmViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            '취소',
            style: context.textThemeBodyMedium
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        title: Center(
          child: Text(
            state.isEditMode ? '알림 편집' : '알림 추가',
            style: context.textThemeBodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (state.isEditMode) {
                ref.read(addAlarmViewModelProvider.notifier).editAlarm();
              } else {
                ref.read(addAlarmViewModelProvider.notifier).addAlarm();
              }

              Navigator.pop(context);
            },
            child: Text(
              '저장',
              style: context.textThemeBodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '우산을 챙겨야 할 때,\n푸시 알림으로 알려드릴게요!',
                style: context.textThemeBodyMedium
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SelectWidget(
                label: '시각',
                value: state.alarm.time != null
                    ? DateUtil.getHHColonMM(state.alarm.time!)
                    : '',
                hintText: '알림 시각을 선택해 주세요.',
                onTap: () {
                  showSelectTimeModalWidget(context);
                },
              ),
              SelectWidget(
                label: '지역 1',
                value: state.alarm.district1?.streetNameAddress ?? '',
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
                value: state.alarm.district2?.streetNameAddress ?? '',
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
                value: state.alarm.district3?.streetNameAddress ?? '',
                hintText: '확인 지역을 선택해 주세요.',
                onTap: () {
                  showSelectDistrictModalWidget(context, (selectedDistrict) {
                    ref
                        .read(addAlarmViewModelProvider.notifier)
                        .setDistrict3(selectedDistrict);
                  });
                },
              ),
              const SelectPeriodWidget(),
              state.isEditMode
                  ? GestureDetector(
                      onTap: () {
                        showRemoveAlarmRemindPopupWidget(context,
                            onConfirm: () {
                          ref
                              .read(addAlarmViewModelProvider.notifier)
                              .removeAlarm();

                          Navigator.of(context).pop();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Center(
                          child: Text(
                            '알림 삭제',
                            style: context.textThemeBodyMedium.copyWith(
                              color: AvocadoColors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
