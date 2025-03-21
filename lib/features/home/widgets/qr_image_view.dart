import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/styles/qr_image_view_style.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrImageView extends StatelessWidget {
  const CustomQrImageView({super.key, required this.data, required this.themeSwitchCubit});

  final String data;
  final ThemeSwitchCubit themeSwitchCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.r,
      height: 200.r,
      child: QrImageView(
        data: data,
        size: 200.r,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L,
        gapless: true,
        padding: PaddingUtil.zero(),
        constrainErrorBounds: true,
        backgroundColor: AppColors.transparent,
        dataModuleStyle: QrImageViewStyle.dataModuleStyle(themeSwitchCubit),
        eyeStyle: QrImageViewStyle.eyeStyle(themeSwitchCubit),
      ),
    );
  }
}
