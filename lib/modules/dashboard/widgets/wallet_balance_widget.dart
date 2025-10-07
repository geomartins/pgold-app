import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pgold/store.dart';
import 'package:pgold/utils/flex_util.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 280,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/images/profile-avatar.png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Hello ${FlexUtil.ucwordsWithRecase(AppStore.to.user.value?.username ?? '')} 👋',
                          style: TextStyle(
                            fontSize: 17,
                            color: HexColor('#F7FAFC'),
                            fontWeight: FontWeight.w600,
                          )),
                      Text('Top of the morning to you',
                          style: TextStyle(
                            fontSize: 11,
                            color: HexColor('#F7FAFC'),
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/chat-avatar.png',
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/notification-avatar.png',
                  ),
                ],
              )
            ],
          ),
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   leading: CircleAvatar(
          //     radius: 40,
          //     backgroundImage: AssetImage('assets/images/profile-avatar.png'),
          //   ),
          //   title: Text(
          //     'Hello Bafreka ',
          //     style: TextStyle(
          //       fontSize: 17,
          //       color: HexColor('#F7FAFC'),
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Wallet Balance',
                        style: TextStyle(
                          color: HexColor('#F7FAFC'),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/images/eye-avatar.svg',
                        width: 18,
                        height: 18,
                      )
                    ],
                  ),
                  Text(
                    '₦7,0127,237.00 ',
                    style: TextStyle(
                      color: HexColor('#F7FAFC'),
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                'assets/images/ngp-button.svg',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/deposit-button.svg',
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/deposit-button.svg',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
