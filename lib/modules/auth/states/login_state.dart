import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  final email = ''.obs;
  final password = ''.obs;
  final errors = {}.obs;
  final togglePasswordVisibility = true.obs;
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
}
