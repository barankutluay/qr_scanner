import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/themes/app_theme.dart';
import 'package:myproject/core/utils/build_when_util.dart';
import 'package:myproject/core/utils/go_router_util.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      useInheritedMediaQuery: true,
      fontSizeResolver: (fontSize, instance) {
        return fontSize * instance.screenWidth / 375;
      },
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeSwitchCubit(),
          child: BlocBuilder<ThemeSwitchCubit, ThemeSwitchState>(
            buildWhen: buildWhen,
            builder: (context, state) {
              return MaterialApp.router(
                title: AppStrings.appName,
                routerConfig: GoRouterUtil.router,
                debugShowCheckedModeBanner: false,
                theme:
                    state.isDarkMode
                        ? AppTheme.darkTheme(context)
                        : AppTheme.lightTheme(context),
              );
            },
          ),
        );
      },
    );
  }
}
