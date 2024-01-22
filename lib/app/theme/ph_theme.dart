import 'package:flutter/material.dart';
import 'package:nimble_code_exercise/app/theme/colors.dart';

class PhTheme {
  static ThemeData create() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: PhColors.mainViolet),
    );
  }
}
