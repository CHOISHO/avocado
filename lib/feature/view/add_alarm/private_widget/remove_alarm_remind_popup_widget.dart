import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:avocado/config/text_theme.dart';
import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/feature/widget/gradient_cancel_button_widget.dart';
import 'package:avocado/feature/widget/gradient_confirm_button_widget.dart';
import 'package:avocado/feature/widget/show_popup.dart';

void showRemoveAlarmRemindPopupWidget(
  BuildContext context,
  Function(District selectedDistrict) onConfirm,
) {
  showPopup(
    context,
    Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/umbrella.svg',
            width: 85,
            height: 83,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              '알림을 삭제하시겠어요?',
              style: context.textThemeTitleMedium
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '삭제한 알림은 다시 복구할 수 없으며\n푸시 알림을 받을 수 없어요.',
            textAlign: TextAlign.center,
            style: context.textThemeBodyMedium
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 8),
            child: GradientConfirmButton(
              onTap: () {
                // TODO: 알림 삭제
              },
            ),
          ),
          GradientCancelButton(
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ),
  );
}
