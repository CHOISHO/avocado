import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';

class GradientCancelButton extends StatelessWidget {
  const GradientCancelButton({required this.onTap, super.key});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        onTap();
      },
      child: Ink(
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AvocadoColors.mainLight, AvocadoColors.subLight],
          ),
          borderRadius: BorderRadius.circular(16),
          color: AvocadoColors.mainLight,
        ),
        child: Center(
          child: Text(
            '취소',
            style: context.textThemeBodyMedium
                .copyWith(color: AvocadoColors.white),
          ),
        ),
      ),
    );
  }
}
