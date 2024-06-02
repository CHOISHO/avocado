import 'package:flutter/material.dart';

import 'package:avocado/config/avocado_colors.dart';

TextTheme textTheme = TextTheme(
  titleMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
    color: AvocadoColors.black,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 18,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
    color: AvocadoColors.black,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
    color: AvocadoColors.black,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
    color: AvocadoColors.black,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
    color: AvocadoColors.black,
  ),
);

extension UIThemeExtension on BuildContext {
  TextStyle get textThemeTitleMedium =>
      Theme.of(this).textTheme.titleMedium ?? const TextStyle();
  TextStyle get textThemeTitleSmall =>
      Theme.of(this).textTheme.titleSmall ?? const TextStyle();
  TextStyle get textThemeBodyMedium =>
      Theme.of(this).textTheme.bodyMedium ?? const TextStyle();
  TextStyle get textThemeBodySmall =>
      Theme.of(this).textTheme.bodySmall ?? const TextStyle();
  TextStyle get textThemeLabelMedium =>
      Theme.of(this).textTheme.labelMedium ?? const TextStyle();
}
