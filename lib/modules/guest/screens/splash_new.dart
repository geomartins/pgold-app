import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashNew extends GetView<SplashController> {
  static const String id = "/splash_new";
  const SplashNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            // image: const DecorationImage(
            //   image: AssetImage('assets/images/pattern.png'),
            //   fit: BoxFit.cover,
            // ),
            gradient: LinearGradient(
              colors: [
                HexColor('#033EBB'), // Start color
                HexColor('#3772EA'), // End color
              ],
              begin: Alignment.topLeft, // Direction of gradient
              end: Alignment.bottomRight,
            ),
          ),
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
