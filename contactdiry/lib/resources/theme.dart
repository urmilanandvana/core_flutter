
import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static bool isDark = false;
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondryColorLight,
      primary: AppColors.primaryColorLight,
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColorDark,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondryColorDark,
      primary: AppColors.primaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
