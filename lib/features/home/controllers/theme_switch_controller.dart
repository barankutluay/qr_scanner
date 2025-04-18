import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_utility/data/cubits/theme_switch/theme_switch_cubit.dart';

final class ThemeSwitchController {
  const ThemeSwitchController._();

  static void Function(BuildContext context) toggleTheme = (context) {
    unawaited(context.read<ThemeSwitchCubit>().toggleTheme());
  };

  static ThemeSwitchCubit Function(BuildContext context) read = (context) {
    return context.read<ThemeSwitchCubit>();
  };

  static ThemeSwitchCubit Function(BuildContext context) watch = (context) {
    return context.watch<ThemeSwitchCubit>();
  };
}
