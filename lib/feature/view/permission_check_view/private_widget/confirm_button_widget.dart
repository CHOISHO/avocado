import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';
import 'package:avocado/config/text_theme.dart';
import 'package:avocado/util/location.dart';
import 'package:avocado/util/push_notification.dart';

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () async {
        var isPushNotificationPermitted =
            await PushNotificationUtil().handlePermission();
        var isLocationPermitted = await LocationUtil().handlePermission();

        if (isPushNotificationPermitted && isLocationPermitted) {
          Navigator.of(context).pop();
        }
      },
      child: Ink(
        width: MediaQuery.sizeOf(context).width - 32,
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
            '확인',
            style: context.textThemeTitleSmall.copyWith(
              color: AvocadoColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
