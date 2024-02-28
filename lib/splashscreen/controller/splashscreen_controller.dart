import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cart_sqflite/homepage/view/homepage_view.dart';
import 'package:flutter_cart_sqflite/splashscreen/view/splashscreen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late final SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSharedPreference();
  }

  void exitApplication() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      exit(0);
    });
  }

  Future checkSharedPreference() async {
    print("Checking SharedPreferences...");
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 5), () async {
      if (prefs.getString('token') == null) {
        print("Token is null.");
        exitApplication();
      } else {
        print("Token found. Navigating to home...");
        Get.offAll(HomePageView());
      }
    });
  }
}
