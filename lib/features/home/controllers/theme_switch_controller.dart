import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';

class ThemeSwitchController {
  static void Function(BuildContext context) toggleTheme = (BuildContext context) {
    context.read<ThemeSwitchCubit>().toggleTheme();
  };

  static ThemeSwitchCubit Function(BuildContext context) watch = (BuildContext context) {
    return context.watch<ThemeSwitchCubit>();
  };
}
