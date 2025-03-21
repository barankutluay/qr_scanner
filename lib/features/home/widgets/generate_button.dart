import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/controllers/qr_code_controller.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSwitchCubit themeSwitchCubit = ThemeSwitchController.watch(context);
    TextFormFieldCubit textFormFieldCubit = LinkTextFieldController.watch(context);

    return SmoothContainer(
      width: double.infinity,
      height: 48.r,
      child: ElevatedButton(
        onPressed: () => QrCodeController.generateQrCodeAndNavigate(context, textFormFieldCubit, themeSwitchCubit),
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text(AppStrings.generateButtonText),
      ),
    );
  }
}
