import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../errors/failures.dart';
import '../languages/app_translations.dart';

class Utils {
  Utils._();

  static bool get isRTL {
    final bool isRTL = (Get.locale?.languageCode ?? 'ar') == 'ar';
    return isRTL;
  }

  static Shimmer putShimmer({double? width, double? height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey.shade300,
      ),
    );
  }

  //   method to get Images by specific size
  static Future<Uint8List> getBytesFromAsset(String path,
      {required int width, required int height}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static TextDirection getDirection(String text) {
    final string = text.trim();
    if (string.isEmpty) return TextDirection.ltr;
    final firstUnit = string.codeUnitAt(0);
    if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
        firstUnit > 0x0750 && firstUnit < 0x077F ||
        firstUnit > 0x07C0 && firstUnit < 0x07EA ||
        firstUnit > 0x0840 && firstUnit < 0x085B ||
        firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
        firstUnit > 0x08E3 && firstUnit < 0x08FF ||
        firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
        firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
        firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
        firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
        firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
        firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
        firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
        firstUnit > 0x10800 && firstUnit < 0x10805 ||
        firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
        firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
        firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
        firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
        firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
        firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
        firstUnit > 0x1D242 && firstUnit < 0x1D244) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  /// ERROR NOTIFICATION
  static showError(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message,
      barBlur: 5,
      maxWidth: Get.width - 32,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }

  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case AuthFailure:
        return failure.message!;
      case ValidationFailure:
        return failure.message!;
      case InvalidFailure:
        return LocaleKeys.invalidFailure.tr;
      case ServerFailure:
        return LocaleKeys.serverFailure.tr;
      case NetworkFailure:
        return LocaleKeys.networkFailure.tr;
      case UnVerifiedFailure:
        return LocaleKeys.unVerifiedFailure.tr;
      case ExpiredPlanFailure:
        return failure.message!;

      default:
        return LocaleKeys.unExpectedError.tr;
    }
  }
}
