import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/features/home_feature/presentation/splash/controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return const Scaffold(
          body: Center(
              child: FlutterLogo(
            size: 100,
          )),
        );
      },
    );
  }
}
