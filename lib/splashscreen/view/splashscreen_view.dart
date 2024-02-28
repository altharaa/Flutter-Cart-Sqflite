import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_cart_sqflite/helper/themes.dart';
import 'package:flutter_cart_sqflite/splashscreen/controller/splashscreen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashController splashScreenController =
  Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 250,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}