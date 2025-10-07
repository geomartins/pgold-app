import 'package:get/get.dart';
import '../controllers/rates_controller.dart';

class RatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatesController>(() => RatesController());
  }
}
