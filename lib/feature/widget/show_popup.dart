import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';

Future<void> showPopup(BuildContext context, Widget child) async {
  await showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AvocadoColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: child,
          ),
        );
      });
}
