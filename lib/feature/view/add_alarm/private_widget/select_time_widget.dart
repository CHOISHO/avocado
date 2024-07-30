import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';

final List<Map<String, dynamic>> timeList = [
  {
    'label': '오전 8:00',
    'value': 8,
  },
  {
    'label': '오후 12:00',
    'value': 12,
  },
  {
    'label': '오후 5:00',
    'value': 17,
  },
];

class SelectTimeWidget extends ConsumerWidget {
  const SelectTimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(addAlarmViewModelProvider).alarm.time;

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '시각',
              style: context.textThemeBodySmall.copyWith(
                color: AvocadoColors.grey02,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                timeList.length,
                (index) {
                  final time = timeList[index];

                  return Ink(
                    height: 56,
                    decoration: BoxDecoration(
                      color: AvocadoColors.grey05,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(addAlarmViewModelProvider.notifier)
                            .setTime(time['value']);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: (MediaQuery.sizeOf(context).width -
                                (16 * 2) -
                                (7 * 3)) /
                            3,
                        child: Center(
                          child: Text(
                            time['label'],
                            style: context.textThemeBodyMedium.copyWith(
                              color: value == time['value']
                                  ? AvocadoColors.main
                                  : AvocadoColors.grey04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
