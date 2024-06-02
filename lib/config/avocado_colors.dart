import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class AvocadoColors {
  static Color main = hexToColor('#007ADF');
  static Color mainLight = hexToColor('#8CC3F1');

  static Color sub = hexToColor('#48BED9');
  static Color subLight = hexToColor('#A3DFEC');

  static Color black = hexToColor('#151617');

  static Color grey01 = hexToColor('#3B3F42');
  static Color grey02 = hexToColor('#7B7F84');
  static Color grey03 = hexToColor('#878D94');
  static Color grey04 = hexToColor('#9EA5AA');
  static Color grey05 = hexToColor('#F1F5F8');

  static Color white = hexToColor('#FFFFFF');

  static Color red = hexToColor('#D32F2F');
}
