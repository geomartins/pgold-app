import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../config/enumefy.dart';
import '../config/palletefy.dart';

class NotificationUtil {
  void showErrorSnackbar(String title, String subtitle) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(title, subtitle,
        icon: const Icon(Icons.details_sharp, color: Colors.white),
        borderRadius: 0,
        isDismissible: true,
        margin: const EdgeInsets.all(0),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Palletefy().errorColor(ThemeModeType.systemMode),
        colorText: Palletefy().textColor(ThemeModeType.darkMode),
        duration: const Duration(seconds: 5));
  }

  void showSuccessSnackbar(String title, String subtitle, {int duration = 5}) {
    Get.snackbar(title, subtitle,
        icon: const Icon(Icons.alt_route_outlined, color: Colors.white),
        borderRadius: 0,
        isDismissible: true,
        margin: const EdgeInsets.all(0),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Palletefy().primaryColor(ThemeModeType.systemMode),
        colorText: Palletefy().textColor(ThemeModeType.darkMode),
        duration: Duration(seconds: duration));
  }
}
