import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pgold/store.dart';

class GlobalUtil {
  static Future init() async {
    try {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } catch (e) {
      debugPrint(e.toString());
    }

    try {
      await GetStorage.init();
      // Get.put<SessionUtil>(SessionUtil());
      Get.put<AppStore>(AppStore());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static double scaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Base dimensions for scaling
    double baseWidth = 400;
    double baseHeight = 800;

    // Calculate scale factor
    double scaleFactor = (width / baseWidth + height / baseHeight) / 2;

    // Ensure max scale factor does not exceed 0.9
    //return min(scaleFactor, .90);
    return min(scaleFactor, 1.2);
  }
}
