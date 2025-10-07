import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/banner.png',
            width: Get.width,
            height: 135,
          ),
          const SizedBox(height: 15),
          SvgPicture.asset(
            'assets/images/banner-indicator.svg',
            height: 3,
          ),
        ],
      ),
    );
  }
}
