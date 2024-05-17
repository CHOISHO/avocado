import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_period_widget.dart';
import 'package:avocado/feature/view/add_alarm/private_widget/select_widget.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';

class AddAlarmView extends ConsumerWidget {
  const AddAlarmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // TODO: 알림 저장 로직
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
              value: '',
              hintText: '알림 시각을 선택해 주세요.',
              onTap: () {
                // TODO: 알림 시각 선택 모달
              },
            ),
            SelectWidget(
              label: '지역 1',
              value: '',
              hintText: '확인 지역을 선택해 주세요.',
              onTap: () {
                // TODO: 알림 지역 선택 모달
              },
            ),
            SelectWidget(
              label: '지역 2',
              value: '',
              hintText: '확인 지역을 선택해 주세요.',
              onTap: () {
                // TODO: 알림 지역 선택 모달
              },
            ),
            SelectWidget(
              label: '지역 3',
              value: '',
              hintText: '확인 지역을 선택해 주세요.',
              onTap: () {
                // TODO: 알림 지역 선택 모달
              },
            ),
            const SelectPeriodWidget()
          ],
        ),
      ),
    );
  }
}
