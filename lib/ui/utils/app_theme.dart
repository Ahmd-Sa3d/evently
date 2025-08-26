import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.whiteBG),
    scaffoldBackgroundColor: AppColors.whiteBG,
    textTheme: TextTheme(
      titleMedium: AppFonts.darkGray20inter700,
      labelSmall: AppFonts.blueItalic17inter700,
      labelMedium: AppFonts.white20inter500,
    ),
    hintColor: AppColors.grayTextField,
    colorScheme: ColorScheme.light(onSurface: AppColors.darkGray),
  );




  static final ThemeData darkMode = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.darkblueBG),
    scaffoldBackgroundColor: AppColors.darkblueBG,
    textTheme: TextTheme(
      titleMedium: AppFonts.darkGray20inter700.copyWith(color: Colors.white),
      labelMedium: AppFonts.white20inter500,
      labelSmall: AppFonts.white16inter500,
    ),
    hintColor: AppColors.white,
    colorScheme: ColorScheme.dark(onSurface: AppColors.white),

    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.white,
    ),
  );
}
