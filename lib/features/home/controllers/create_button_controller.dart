import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/features/home/widgets/generate_qr_code_bottom_sheet/generate_qr_code_bottom_sheet.dart';

final class CreateButtonController {
  const CreateButtonController._();

  static void handleOnPressed(BuildContext context) {
    unawaited(
      showCustomModalBottomSheet(context, widget: GenerateQrCodeBottomSheet()),
    );
  }
}
