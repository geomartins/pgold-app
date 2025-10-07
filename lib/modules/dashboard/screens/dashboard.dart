import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgold/modules/dashboard/widgets/quick_action_widget.dart';
import 'package:pgold/modules/dashboard/widgets/wallet_balance_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/banner_widget.dart';

class Dashboard extends GetView<DashboardController> {
  static const String id = "/dashboard";
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: HexColor('#033EBB'),
    // ));
    return const Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: 0,
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WalletBalanceWidget(),
                  QuickActionWidget(),
                  BannerWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
