import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/styles/theme_switch_style.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSwitchCubit themeSwitchCubit = ThemeSwitchController.watch(context);

    return SmoothContainer(
      child: SizedBox(
        width: 65.r,
        height: 40.r,
        child: Switch(
          value: themeSwitchCubit.state.isDarkMode,
          onChanged: (_) => ThemeSwitchController.toggleTheme(context),
          activeColor: AppColors.darkPrimaryContainer,
          activeTrackColor: AppColors.darkPrimaryContainer,
          trackOutlineColor: ThemeSwitchStyle.trackOutlineColor(themeSwitchCubit),
          thumbColor: ThemeSwitchStyle.thumbColor(themeSwitchCubit),
          thumbIcon: ThemeSwitchStyle.thumbIcon(themeSwitchCubit),
        ),
      ),
    );
  }
}
