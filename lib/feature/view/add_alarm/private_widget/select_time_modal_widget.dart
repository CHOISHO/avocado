import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view_model/add_alarm_view_model.dart';
import 'package:avocado/util/date.dart';

void showSelectTimeModalWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    enableDrag: false,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    builder: (BuildContext context) => const SelectTimeModalWidget(),
  );
}

class SelectTimeModalWidget extends StatefulWidget {
  const SelectTimeModalWidget({super.key});

  @override
  State<SelectTimeModalWidget> createState() => _SelectTimeModalWidgetState();
}

class _SelectTimeModalWidgetState extends State<SelectTimeModalWidget> {
  int _selectedTime = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      height: 300,
      child: Column(
        children: [
          Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedTime = index;
                });
              },
              children: List.generate(
                24,
                (index) => Text(DateUtil.getHHColonMM(index)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Consumer(
              builder: (context, ref, child) {
                return InkWell(
                  onTap: () {
                    ref
                        .read(addAlarmViewModelProvider.notifier)
                        .setTime(_selectedTime);

                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    width: double.infinity,
                    height: 56,
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
                      borderRadius: BorderRadius.circular(16),
                      color: AvocadoColors.mainLight,
                    ),
                    child: Center(
                      child: Text(
                        '선택 완료',
                        style: context.textThemeTitle2.copyWith(
                          color: AvocadoColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
