import 'dart:math';

import 'package:flutter/material.dart';

class ColorPalette {
  static MaterialColor color003461 = generateMaterialColor(const Color(0xff003461));
  static MaterialColor color0083CA = generateMaterialColor(const Color(0xff0083CA));
  static MaterialColor color00AFAD = generateMaterialColor(const Color(0xff00AFAD));
  static MaterialColor colorF26522 = generateMaterialColor(const Color(0xffF26522));
  static MaterialColor colorFCAF17 = generateMaterialColor(const Color(0xffFCAF17));

  static const Color whiteBackground = Color(0xffFFFFFF);
  static MaterialColor grayBorderMaterial =
      generateMaterialColor(const Color(0xffE0E2E7));
  static const Color grayHint = Color(0xffC7C9D9);
  static Color colorWhitSmoke = const Color(0xfff5f5f5);
  static const Color black33333F = Color(0xff33333F);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: _tintColor(color, 0.9),
    100: _tintColor(color, 0.8),
    200: _tintColor(color, 0.6),
    300: _tintColor(color, 0.4),
    400: _tintColor(color, 0.2),
    500: color,
    600: _shadeColor(color, 0.1),
    700: _shadeColor(color, 0.2),
    800: _shadeColor(color, 0.3),
    900: _shadeColor(color, 0.4),
  });
}

int _tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color _tintColor(Color color, double factor) => Color.fromRGBO(
    _tintValue(color.red, factor),
    _tintValue(color.green, factor),
    _tintValue(color.blue, factor),
    1);

int _shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color _shadeColor(Color color, double factor) => Color.fromRGBO(
    _shadeValue(color.red, factor),
    _shadeValue(color.green, factor),
    _shadeValue(color.blue, factor),
    1);

extension MemberColor on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
