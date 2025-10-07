import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pgold/config/enumefy.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:pgold/modules/dashboard/widgets/crypto_rates_widget.dart';
import 'package:pgold/modules/dashboard/widgets/gift_card_rates_widget.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../controllers/rates_controller.dart';

class Rates extends GetView<RatesController> {
  static const String id = "/rates";
  const Rates({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: AnnotatedRegionWidget(
        child: Scaffold(
            bottomNavigationBar: const BottomNavigationBarWidget(
              currentIndex: 3,
            ),
            appBar: AppBarWidget(
              title: 'Rates',
              textColor: HexColor('#000000'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/images/question-circle-icon.svg',
                  ),
                )
              ],
            ),
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  ButtonsTabBar(
                    width: Get.width / 2,
                    height: 50,
                    backgroundColor:
                        Palletefy().primaryColor(ThemeModeType.systemMode),
                    contentCenter: true,
                    unselectedBackgroundColor: HexColor('#F7F9FC'),
                    unselectedLabelStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    tabs: [
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/images/gift-card-icon.svg',
                        ),
                        text: "Giftcard",
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/images/bitcoin-icon.svg',
                        ),
                        text: "Crypto",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        GiftCardRatesWidget(controller: controller),
                        CryptoRatesWidget(controller: controller)
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
