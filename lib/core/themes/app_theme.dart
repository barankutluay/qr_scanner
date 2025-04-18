import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/themes/app_bottom_sheet_theme.dart';
import 'package:qr_code_utility/core/themes/app_dialog_theme.dart';
import 'package:qr_code_utility/core/themes/app_elevated_button_theme.dart';
import 'package:qr_code_utility/core/themes/app_icon_button_theme.dart';
import 'package:qr_code_utility/core/themes/app_icon_theme.dart';
import 'package:qr_code_utility/core/themes/app_input_decoration_theme.dart';
import 'package:qr_code_utility/core/themes/app_progress_indicator_theme.dart';
import 'package:qr_code_utility/core/themes/app_snackbar_theme.dart';
import 'package:qr_code_utility/core/themes/app_text_button_theme.dart';
import 'package:qr_code_utility/core/themes/app_text_selection_theme.dart';
import 'package:qr_code_utility/core/themes/app_text_theme.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData light(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      primaryColor: AppColors.lightPrimary,
      scaffoldBackgroundColor: AppColors.lightSurface,
      shadowColor: AppColors.lightShadow,
      indicatorColor: AppColors.lightPrimaryContainer,
      splashColor: AppColors.lightSurfaceContainerLow,
      highlightColor: AppColors.lightSurfaceContainerHighest,
      dividerColor: AppColors.lightOutline,

      textTheme: AppTextTheme.light,
      iconTheme: AppIconTheme.light,
      iconButtonTheme: AppIconButtonTheme.light,
      bottomSheetTheme: AppBottomSheetTheme.light,
      textSelectionTheme: AppTextSelectionTheme.light,
      progressIndicatorTheme: AppProgressIndicatorTheme.light,
      dialogTheme: AppDialogTheme.light,

      elevatedButtonTheme: AppElevatedButtonTheme.light(context),
      textButtonTheme: AppTextButtonTheme.light(context),
      inputDecorationTheme: AppInputDecorationTheme.light(context),
      snackBarTheme: AppSnackbarTheme.light(context),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      primaryColor: AppColors.darkPrimary,
      scaffoldBackgroundColor: AppColors.darkSurface,
      shadowColor: AppColors.darkShadow,
      indicatorColor: AppColors.darkPrimaryContainer,
      splashColor: AppColors.darkSurfaceContainerLow,
      highlightColor: AppColors.darkSurfaceContainerHighest,
      dividerColor: AppColors.darkOutline,

      textTheme: AppTextTheme.dark,
      iconTheme: AppIconTheme.dark,
      iconButtonTheme: AppIconButtonTheme.dark,
      bottomSheetTheme: AppBottomSheetTheme.dark,
      textSelectionTheme: AppTextSelectionTheme.dark,
      progressIndicatorTheme: AppProgressIndicatorTheme.dark,
      dialogTheme: AppDialogTheme.dark,

      elevatedButtonTheme: AppElevatedButtonTheme.dark(context),
      textButtonTheme: AppTextButtonTheme.dark(context),
      inputDecorationTheme: AppInputDecorationTheme.dark(context),
      snackBarTheme: AppSnackbarTheme.dark(context),
    );
  }
}
