import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view/add_alarm/add_alarm_view.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';

class AddAlarmButtonWidget extends ConsumerWidget {
  const AddAlarmButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 141,
        height: 48,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        clipBehavior: Clip.hardEdge,
        child: FloatingActionButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () {
              ref.read(addAlarmViewModelProvider.notifier).reset();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddAlarmView(),
                ),
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AvocadoColors.main, AvocadoColors.sub],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AvocadoColors.black.withOpacity(0.16),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                  BoxShadow(
                    color: AvocadoColors.black.withOpacity(0.08),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(4, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(32),
                color: AvocadoColors.mainLight,
              ),
              child: Center(
                child: Text(
                  '+ 알람 설정',
                  style: context.textThemeBodyMedium
                      .copyWith(color: AvocadoColors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
