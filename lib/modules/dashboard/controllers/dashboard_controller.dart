import 'package:get/get.dart';
import 'package:pgold/modules/dashboard/editors/dashboard_editor.dart';
import 'package:pgold/modules/dashboard/states/dashboard_state.dart';
import 'package:pgold/utils/validator_ext_util.dart';

class DashboardController extends GetxController with ValidatorExtUtil {
  final state = DashboardState();
  final editor = DashboardEditor();
  //CONSTRUCTOR

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
