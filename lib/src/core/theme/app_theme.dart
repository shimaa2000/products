import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData generate(String fontFamily) {
    return ThemeData(
      fontFamily: fontFamily,
      canvasColor: Colors.white,
      dialogBackgroundColor: Colors.white,
    );
  }
}
