import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:pgold/modules/dashboard/screens/rates.dart';
import 'package:pgold/store.dart';

import '../config/enumefy.dart';
import '../modules/dashboard/screens/dashboard.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  const BottomNavigationBarWidget({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(BottomNavigationBarWidgetController());
    c.updateSelectedIndex(currentIndex);
    return BottomNavigationBar(
      currentIndex: currentIndex < 0 ? 0 : currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: c.selectedIndex < 0
          ? Colors.grey
          : Palletefy().primaryColor(ThemeModeType.systemMode),
      type: BottomNavigationBarType.fixed,
      onTap: (int value) async {
        if (value == 0) {
          Get.toNamed(Dashboard.id);
        } else if (value == 1) {
        } else if (value == 2) {
        } else if (value == 3) {
          Get.toNamed(Rates.id);
        } else if (value == 4) {
          AppStore.to.logout();
        }
      },
      // iconSize: 20,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/home-menu-icon.svg',
            colorFilter: ColorFilter.mode(
              c.selectedIndex != 0
                  ? HexColor('#718096')
                  : Palletefy()
                      .primaryColor(ThemeModeType.systemMode), // Set the color
              BlendMode.srcIn, // Blend mode for color application
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/history-menu-icon.svg',
            colorFilter: ColorFilter.mode(
              c.selectedIndex != 1
                  ? Colors.grey
                  : Palletefy()
                      .primaryColor(ThemeModeType.systemMode), // Set the color
              BlendMode.srcIn, // Blend mode for color application
            ),
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/card-menu-icon.svg',
            colorFilter: ColorFilter.mode(
              c.selectedIndex != 2
                  ? Colors.grey
                  : Palletefy()
                      .primaryColor(ThemeModeType.systemMode), // Set the color
              BlendMode.srcIn, // Blend mode for color application
            ),
          ),
          label: 'Cards',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/rates-menu-icon.svg',
            colorFilter: ColorFilter.mode(
              c.selectedIndex != 3
                  ? Colors.grey
                  : Palletefy()
                      .primaryColor(ThemeModeType.systemMode), // Set the color
              BlendMode.srcIn, // Blend mode for color application
            ),
          ),
          label: 'Rates',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/profile-menu-icon.svg',
            colorFilter: ColorFilter.mode(
              c.selectedIndex != 4
                  ? Colors.grey
                  : Palletefy()
                      .primaryColor(ThemeModeType.systemMode), // Set the color
              BlendMode.srcIn, // Blend mode for color application
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

class BottomNavigationBarWidgetController extends GetxController {
  //@state
  final _selectedIndex = 0.obs;

  //@getters
  int get selectedIndex => _selectedIndex.value;

  //@mutation
  void updateSelectedIndex(int value) => _selectedIndex.value = value;
}
