import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_monger_mahesh/splash/splash_controller.dart';
import 'package:wine_monger_mahesh/utils/constants/image_constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    SplashScreenController.find.startAnimation();

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              top: splashController.animate.value ? 150 : 0,
              bottom: splashController.animate.value ? 150 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Image(image: AssetImage(kLogoImage)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
