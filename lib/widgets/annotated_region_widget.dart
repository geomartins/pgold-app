import 'package:pgold/config/enumefy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final ThemeModeType themeModeType;
  const AnnotatedRegionWidget(
      {super.key,
      required this.child,
      this.themeModeType = ThemeModeType.systemMode});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarIconBrightness: (themeModeType == ThemeModeType.systemMode)
              ? (Get.isDarkMode ? Brightness.light : Brightness.dark)
              : (themeModeType == ThemeModeType.lightMode
                  ? Brightness.dark
                  : Brightness.light),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: child,
        ));
  }
}
