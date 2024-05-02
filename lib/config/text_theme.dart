import 'package:flutter/material.dart';

TextTheme textTheme = const TextTheme(
  titleMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20,
    letterSpacing: -0.25,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 18,
    letterSpacing: -0.25,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    letterSpacing: -0.25,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    letterSpacing: -0.25,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    letterSpacing: -0.25,
  ),
);

extension UIThemeExtension on BuildContext {
  TextStyle get themeTitle1 => Theme.of(this).textTheme.titleMedium ?? const TextStyle();
  TextStyle get themeTitle2 => Theme.of(this).textTheme.titleSmall ?? const TextStyle();
  TextStyle get themeBody1 => Theme.of(this).textTheme.bodyMedium ?? const TextStyle();
  TextStyle get themeBody2 => Theme.of(this).textTheme.bodySmall ?? const TextStyle();
  TextStyle get themeLabel => Theme.of(this).textTheme.labelMedium ?? const TextStyle();
}
