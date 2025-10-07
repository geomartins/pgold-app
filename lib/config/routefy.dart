import 'package:pgold/modules/auth/auth_routes.dart';
import 'package:pgold/modules/dashboard/dashboard_routes.dart';
import 'package:pgold/modules/guest/guest_routes.dart';
import 'package:get/get.dart';
import '../modules/guest/screens/page_not_found.dart';
import '../modules/guest/screens/splash.dart';

class Routefy implements Bindings {
  static String initial = Splash.id;
  static Transition defaultTransition = Transition.fadeIn;
  static GetPage unknownRoute = GetPage(
    name: PageNotFound.id,
    page: () => const PageNotFound(),
  );

  static List<GetPage> all() {
    return [
      ...GuestRoutes.all(),
      ...AuthRoutes.all(),
      ...DashboardRoutes.all(),
    ];
  }

  static List<String> excludeFromTimeout() {
    List<String> result = [];
    final routeList = [...AuthRoutes.all(), ...GuestRoutes.all()];
    for (final x in routeList) {
      result.add(x.name);
    }
    return result;
  }

  @override
  void dependencies() {}
}
