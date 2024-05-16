import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';

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
          children: [
            Text(
              '우산을 챙겨야 할 때,\n푸시 알림으로 알려드릴게요!',
              style:
                  context.textThemeBody1.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
