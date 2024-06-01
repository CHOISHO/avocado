import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/alarm_model.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';

class SelectPeriodWidget extends ConsumerWidget {
  const SelectPeriodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addAlarmViewModelProvider);

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '주기',
              style: context.textThemeBody2.copyWith(
                color: AvocadoColors.grey02,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              AlarmPeriodType.values.length,
              (index) {
                final period = AlarmPeriodType.values[index];
                final isSelected = state.alarm.period == period;

                return Ink(
                  height: 56,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AvocadoColors.main : AvocadoColors.grey05,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () async {
                      if (index == 3) {
                        var selectedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year +
                              1), // TODO: 정책적으로 지원가능한 날짜 확인
                          barrierDismissible: false,
                        );

                        if (selectedDate != null) {
                          ref
                              .read(addAlarmViewModelProvider.notifier)
                              .setCustomPeriod(selectedDate);
                        }
                      } else {
                        ref
                            .read(addAlarmViewModelProvider.notifier)
                            .setPeriod(period);
                      }
                    },
                    child: SizedBox(
                      width: (MediaQuery.sizeOf(context).width -
                              (16 * 2) -
                              (7 * 3)) /
                          4,
                      child: Center(
                        child: Text(
                          AlarmPeriodType.values[index].label,
                          style: context.textThemeBody1.copyWith(
                            color: isSelected
                                ? AvocadoColors.white
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
          )
        ],
      ),
    );
  }
}
