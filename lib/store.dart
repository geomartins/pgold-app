import 'package:get/get.dart';
import 'package:pgold/utils/session_util.dart';
import 'modules/auth/models/user_model.dart';
import 'modules/auth/screens/login.dart';
import 'dart:convert';

class AppStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppStore>(AppStore());
  }
}

class AppStore extends GetxController {
  static AppStore get to => Get.find();

  final Rxn<UserModel> user = Rxn<UserModel>();

  // computed getters
  bool get isLoggedIn => SessionUtil().read('token') != null;
  bool get isOnboarded => SessionUtil().read('onboarding') != null;

  @override
  void onInit() {
    super.onInit();
    refreshLoginState();
  }

  Future<void> onboard(String value) async {
    await SessionUtil().write('onboarding', value);
    update();
  }

  Future<void> login(String token, Map<String, dynamic> userData) async {
    await SessionUtil().write('token', token);
    await SessionUtil().write('user', jsonEncode(userData));

    user.value = UserModel.fromJson(userData);
    update();
  }

  Future<void> logout() async {
    await SessionUtil().remove('token');
    await SessionUtil().remove('user');
    user.value = null;
    update();
    Get.offAllNamed(Login.id);
  }

  void refreshLoginState() {
    final storedUser = SessionUtil().read('user');
    if (storedUser != null) {
      user.value = UserModel.fromJson(jsonDecode(storedUser));
    }
    update();
  }
}
