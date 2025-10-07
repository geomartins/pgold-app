import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:pgold/modules/guest/screens/onboarding.dart';
import 'package:pgold/modules/guest/screens/page_not_found.dart';
import 'package:pgold/modules/guest/screens/splash.dart';
import 'bindings/onboarding_binding.dart';
import 'bindings/splash_binding.dart';

class GuestRoutes {
  static List<GetPage> all() {
    return [
      GetPage(
          name: Splash.id,
          page: () => const Splash(),
          binding: SplashBinding()),
      GetPage(
          name: Onboarding.id,
          page: () => const Onboarding(),
          binding: OnboardingBinding()),
      GetPage(name: PageNotFound.id, page: () => const PageNotFound()),
    ];
  }
}
