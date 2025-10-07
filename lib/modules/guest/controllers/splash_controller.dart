import 'package:get/get.dart';
import 'package:pgold/modules/auth/screens/login.dart';
import 'package:pgold/store.dart';
import '../screens/onboarding.dart';
import '../states/splash_state.dart';

class SplashController extends GetxController {
  SplashController();
  final state = SplashState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      if (AppStore.to.isOnboarded == false) {
        Get.offAllNamed(Onboarding.id);
      } else {
        Get.offAllNamed(Login.id);
      }
    });
  }
}
