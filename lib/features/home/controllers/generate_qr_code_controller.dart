import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/core/utils/save_data_util.dart';
import 'package:myproject/core/utils/share_util.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/widgets/custom_qr_image_view.dart';
import 'package:myproject/features/home/widgets/generated_code_bottom_sheet/generated_code_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

final class GenerateQrCodeController {
  const GenerateQrCodeController._();

  static void shareQrCode(BuildContext context, GlobalKey repaintKey) {
    unawaited(
      share(
        context,
        onShareFiles: () async {
          return GenerateQrCodeController.onShareFiles(repaintKey);
        },
      ),
    );
  }

  static void handleOnPressed(BuildContext context, GlobalKey repaintKey) {
    unawaited(
      GenerateQrCodeController.generateQrCodeAndNavigate(context, repaintKey),
    );
  }

  static Future<void> generateQrCodeAndNavigate(
    BuildContext context,
    GlobalKey repaintKey,
  ) async {
    try {
      final textFormFieldCubit = LinkTextFieldController.read(context);
      final url = textFormFieldCubit.state.value;

      if (!LinkTextFieldController.validateLink(context, url)) return;
      final Widget qrImageView = CustomQrImageView(
        data: textFormFieldCubit.state.value,
        repaintKey: repaintKey,
      );

      if (context.mounted && context.canPop()) {
        context.pop();
        await Future.wait([
          Future.delayed(AppDurations.duration300ms, () {
            if (context.mounted) {
              showCustomModalBottomSheet(
                context,
                widget: GeneratedCodeBottomSheet(qrImageView, repaintKey, url),
              );
            }
          }),
          saveData(url: url, time: DateTime.now(), type: 0),
        ]);
      }
    } catch (error, stackTrace) {
      LoggerUtil.error('QR Generate Error: $error', stackTrace);
      rethrow;
    }
  }

  static Future<List<XFile>> captureImage(GlobalKey repaintKey) async {
    try {
      final renderObject = repaintKey.currentContext?.findRenderObject();

      if (renderObject == null || (renderObject is! RenderRepaintBoundary)) {
        throw 'RenderRepaintBoundary not found!';
      }
      final boundary = renderObject;
      await Future.delayed(AppDurations.duration100ms);
      final image = await boundary.toImage(pixelRatio: 5);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw 'ByteData is null!';
      }
      final pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final filePath =
          '${tempDir.path}/qr_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);
      final decodedImage = await decodeImageFromList(pngBytes);

      LoggerUtil.info(
        'QR Boyutları: ${decodedImage.width}x${decodedImage.height}',
      );

      return [XFile(file.path)];
    } catch (error, stackTrace) {
      if (error is String) {
        LoggerUtil.error(error, stackTrace);
      }
      rethrow;
    }
  }

  static Future<List<XFile>> onShareFiles(GlobalKey repaintKey) async {
    final capturedImage = await GenerateQrCodeController.captureImage(
      repaintKey,
    );
    return capturedImage;
  }
}
