import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';

class QuickActionWidget extends StatelessWidget {
  const QuickActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = [
      {
        'icon': 'assets/images/crypto-action-icon.svg',
        'text': 'Crypto',
        'url': '',
        'ext': 'svg',
        'color': '#F0F3EE'
      },
      {
        'icon': 'assets/images/gift-card-action-icon.svg',
        'text': 'Giftcards',
        'url': '',
        'ext': 'svg',
        'color': '#F3EDFC'
      },
      {
        'icon': 'assets/images/top-up-action-icon.svg',
        'text': 'Top Up',
        'url': '',
        'ext': 'svg',
        'color': '#FDF0EA'
      },
      {
        'icon': 'assets/images/cable-tv-action-icon.svg',
        'text': 'Cable Tv',
        'url': '',
        'ext': 'svg',
        'color': '#F0F5FF'
      },
      {
        'icon': 'assets/images/electricity-action-icon.svg',
        'text': 'Electricity',
        'url': '',
        'ext': 'svg',
        'color': '#FFEBF4'
      },
      {
        'icon': 'assets/images/betting-action-icon.svg',
        'text': 'Betting',
        'url': '',
        'ext': 'svg',
        'color': '#F6F3FE'
      },
      {
        'icon': 'assets/images/flight-action-icon.svg',
        'text': 'Flight',
        'url': '',
        'ext': 'svg',
        'color': '#EDF9FC'
      },
      {
        'icon': 'assets/images/user-rank-action-icon.svg',
        'text': 'User Rank',
        'url': '',
        'ext': 'svg',
        'color': '#FEF1F0'
      },
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Quick Action',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/more-icon.svg',
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      Palletefy().primaryColor(
                          ThemeModeType.systemMode), // Set the color
                      BlendMode.srcIn, // Blend mode for color application
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 5.0,
              mainAxisExtent: 105,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              return InkWell(
                onTap: () => Get.toNamed(item['url'].toString()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      //margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Ensures it's a circle

                        // borderRadius: BorderRadius.circular(100),
                        color: HexColor(item['color'].toString()),
                      ),
                      child: Center(
                        child: item['ext'].toString() == 'svg'
                            ? SvgPicture.asset(
                                item['icon'].toString(),
                                // colorFilter: ColorFilter.mode(
                                //   Get.isDarkMode
                                //       ? Colors.white.withOpacity(.3)
                                //       : HexColor(item['color']
                                //           .toString()), // Set the color
                                //   BlendMode
                                //       .srcIn, // Blend mode for color application
                                // ),
                                // color: HexColor(item['color'].toString()),
                              )
                            : Image.asset(item['icon'].toString()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['text'].toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: HexColor('#2A313C'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
