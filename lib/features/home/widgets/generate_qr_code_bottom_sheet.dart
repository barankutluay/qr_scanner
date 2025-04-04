import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/features/home/widgets/generate_button.dart';
import 'package:myproject/features/home/widgets/info_widget.dart';
import 'package:myproject/features/home/widgets/link_text_field.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GenerateQrCodeBottomSheet extends StatelessWidget {
  GenerateQrCodeBottomSheet({super.key});

  final GlobalKey repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFormFieldCubit(),
      child: BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
        builder: (context, state) {
          return SmoothContainer(
            width: double.infinity,
            child: Padding(
              padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.generateQrCodeBottomSheetTitle,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  16.verticalSpacingRadius,
                  InfoWidget(),
                  16.verticalSpacingRadius,
                  LinkTextField(),
                  24.verticalSpacingRadius,
                  GenerateButton(repaintKey: repaintKey),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
