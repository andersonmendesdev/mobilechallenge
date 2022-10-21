import 'package:flutter/material.dart';

import 'palette.dart';

class InputDecorationThemeCustom {
  static TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  static OutlineInputBorder _builderBoder(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide(color: color, width: 1.0));
  }

  static OutlineInputBorder _builderBoderFocus(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide(color: color, width: 1.5));
  }

  static InputDecorationTheme theme(Color primaryColor) {
    return InputDecorationTheme(
      contentPadding:const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      //constraints: BoxConstraints(maxWidth: 467),
      //border
      filled: true,
      fillColor: ColorPalette.whiteBackground,
      enabledBorder: _builderBoder(ColorPalette.grayBorderMaterial[600]!),
      errorBorder: _builderBoder(Colors.red),
      focusedErrorBorder: _builderBoderFocus(Colors.red),
      border: _builderBoder(ColorPalette.grayBorderMaterial[600]!),
      focusedBorder: _builderBoderFocus(primaryColor),
      disabledBorder: _builderBoder(Colors.grey[400]!),
      //textStyle
      //
      suffixStyle: _buildTextStyle(Colors.black87),
      counterStyle: _buildTextStyle(Colors.grey, size: 12),
      floatingLabelStyle: _buildTextStyle(Colors.black87),
      errorStyle: _buildTextStyle(Colors.red, size: 12),
      helperStyle: _buildTextStyle(Colors.black87, size: 12),
      hintStyle: _buildTextStyle(ColorPalette.grayHint),
      labelStyle: _buildTextStyle(Colors.black87),
      prefixStyle: _buildTextStyle(Colors.black87),
    );
  }
}

//EdgeInsets.fromLTRB(12, 16, 12, 16),