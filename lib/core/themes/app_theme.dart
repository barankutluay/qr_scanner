import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/themes/app_bottom_sheet_theme.dart';
import 'package:myproject/core/themes/app_elevated_button_theme.dart';
import 'package:myproject/core/themes/app_icon_button_theme.dart';
import 'package:myproject/core/themes/app_icon_theme.dart';
import 'package:myproject/core/themes/app_input_decoration_theme.dart';
import 'package:myproject/core/themes/app_text_selection_theme.dart';
import 'package:myproject/core/themes/app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightSurface,
      shadowColor: AppColors.black,
      indicatorColor: AppColors.lightPrimaryContainer,

      elevatedButtonTheme: AppElevatedButtonTheme.light(context),
      inputDecorationTheme: AppInputDecorationTheme.light(context),

      textTheme: AppTextTheme.light,
      iconTheme: AppIconTheme.light,
      iconButtonTheme: AppIconButtonTheme.light,
      bottomSheetTheme: AppBottomSheetTheme.light,
      textSelectionTheme: AppTextSelectionTheme.light,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkSurface,
      shadowColor: AppColors.black,
      indicatorColor: AppColors.darkPrimaryContainer,

      elevatedButtonTheme: AppElevatedButtonTheme.dark(context),
      inputDecorationTheme: AppInputDecorationTheme.dark(context),

      textTheme: AppTextTheme.dark,
      iconTheme: AppIconTheme.dark,
      iconButtonTheme: AppIconButtonTheme.dark,
      bottomSheetTheme: AppBottomSheetTheme.dark,
      textSelectionTheme: AppTextSelectionTheme.dark,
    );
  }
}
