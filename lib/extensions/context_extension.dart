import 'package:flutter/material.dart';

extension ThemeBrightness on BuildContext {
  bool get isDarkMode {
    final Brightness brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
