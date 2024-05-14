import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view/search_district/search_district_view.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => const SearchDistrictView(),
          clipBehavior: Clip.hardEdge,
          enableDrag: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        );
      },
      child: Ink(
        width: 141,
        height: 48,
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
            style: context.textThemeBody1.copyWith(color: AvocadoColors.white),
          ),
        ),
      ),
    );
  }
}
