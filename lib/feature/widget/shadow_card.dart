import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';

Widget shadowCard(Widget child) {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AvocadoColors.black.withOpacity(0.03),
          blurRadius: 15,
          spreadRadius: 10,
          offset: const Offset(0, 10),
        ),
        BoxShadow(
          color: AvocadoColors.black.withOpacity(0.0165),
          blurRadius: 7.5,
          spreadRadius: 5,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: AvocadoColors.black.withOpacity(0.0095),
          blurRadius: 5,
          spreadRadius: 2.5,
          offset: const Offset(0, 2.5),
        ),
      ],
    ),
    child: child,
  );
}
