import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pgold/config/enumefy.dart';
import 'package:pgold/config/palletefy.dart';
import '../controllers/splash_controller.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  static const String id = "/splash";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palletefy().primaryColor(ThemeModeType.systemMode),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        minimum: const EdgeInsets.only(bottom: 10),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/app-logo.svg',
                width: 190,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
