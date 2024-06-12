import 'package:flutter/material.dart';

import 'package:easy_debounce/easy_debounce.dart';

import 'package:avocado/config/avocado_colors.dart';

class DebouncedSwitchWidget extends StatelessWidget {
  const DebouncedSwitchWidget(
      {required this.value, required this.onTap, super.key});

  final bool value;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        EasyDebounce.debounce(
          DateTime.timestamp().toString(),
          const Duration(milliseconds: 500),
          () {
            onTap();
          },
        );
      },
      child: AbsorbPointer(
        child: Switch(
          value: value,
          activeColor: AvocadoColors.main,
          thumbColor: MaterialStatePropertyAll(AvocadoColors.white),
          activeTrackColor: AvocadoColors.main,
          inactiveTrackColor: AvocadoColors.grey04,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
