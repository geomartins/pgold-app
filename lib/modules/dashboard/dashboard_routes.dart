import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:pgold/modules/dashboard/bindings/rates_binding.dart';
import 'package:pgold/modules/dashboard/screens/dashboard.dart';
import 'package:pgold/modules/dashboard/screens/rates.dart';
import '../../middlewares/is_auth.dart';
import 'bindings/dashboard_binding.dart';

class DashboardRoutes {
  static List<GetPage> all() {
    return [
      GetPage(
        name: Dashboard.id,
        page: () => const Dashboard(),
        binding: DashboardBinding(),
        middlewares: [
          IsAuth(),
        ],
      ),
      GetPage(
        name: Rates.id,
        page: () => const Rates(),
        binding: RatesBinding(),
        middlewares: [
          IsAuth(),
        ],
      ),
    ];
  }

  static void binds() {
    DashboardBinding();
  }
}
