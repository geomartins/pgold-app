import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pgold/store.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../auth/screens/login.dart';
import '../controllers/onboarding_controller.dart';

class Onboarding extends GetView<OnboardingController> {
  static const String id = '/onboarding';
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.state.pageController,
            onPageChanged: (int value) {
              controller.updateCurrentSlide(value);
            },
            itemCount: controller.state.slides.value.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              final item = controller.state.slides.value[itemIndex];
              return _buildSlides(
                context,
                title: item.title,
                subtitle: item.subtitle,
                image: item.image,
                indicatorImage: item.indicatorImage,
              );
            },
          ),
          Positioned(
            top: 70,
            left: 0,
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 51,
                        height: 32,
                        child: OutlinedButton(
                          onPressed: () async {
                            await AppStore.to.onboard('true');
                            Get.offNamed(Login.id);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // Button background color
                            side: BorderSide(
                                color: Palletefy()
                                    .primaryColor(ThemeModeType.systemMode),
                                width: .8), // Bord
                            minimumSize:
                                Size.zero, // remove minimum size constraints
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // shrink the hit area
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    20), // customize each corner
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Padding inside the button
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Palletefy()
                                    .primaryColor(ThemeModeType.systemMode),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left, // Text color
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlides(BuildContext context,
      {required String title,
      required String subtitle,
      required String image,
      required String indicatorImage}) {
    return SizedBox.expand(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(height: 130),
                SvgPicture.asset(
                  'assets/images/$image',
                  height: 330,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 27,
                      color: Palletefy().textColor(ThemeModeType.systemMode),
                      fontWeight: FontWeight.w600,
                      height: 1.5),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 18,
                      color: HexColor('#718096'),
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/$indicatorImage',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.currentSlide ==
                          controller.state.slides.value.length - 1) {
                        AppStore.to.onboard('true');
                        Get.offNamed(Login.id);
                      } else {
                        controller.state.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Palletefy().primaryColor(ThemeModeType.systemMode),
                      disabledForegroundColor: Palletefy()
                          .primaryColor(ThemeModeType.systemMode)
                          .withOpacity(0.38),
                      disabledBackgroundColor: Palletefy()
                          .primaryColor(ThemeModeType.systemMode)
                          .withOpacity(0.12),
                    ),
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.bodySmall!.merge(
                            TextStyle(
                                color: Palletefy()
                                    .textColor(ThemeModeType.darkMode),
                                fontSize: 17),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
