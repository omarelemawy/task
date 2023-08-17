import 'dart:async';

import 'package:get/get.dart';
import 'package:task/core/routes/app_pages.dart';

class SplashController extends GetxController {
  navigate() async {
    Get.toNamed(Routes.home);
  }

  @override
  void onReady() async {
    Timer(const Duration(seconds: 3), () async => await navigate());

    super.onReady();
  }
}
