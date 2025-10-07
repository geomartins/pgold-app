import 'package:flutter/cupertino.dart';

class RegisterEditor {
  final TextEditingController username = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirmation = TextEditingController();
  final TextEditingController macAddress = TextEditingController();
  final TextEditingController referral = TextEditingController();
  final TextEditingController referralSource = TextEditingController();

  void clear() {
    username.clear();
    fullName.clear();
    phone.clear();
    email.clear();
    password.clear();
    passwordConfirmation.clear();
    macAddress.clear();
    referral.clear();
    referralSource.clear();
  }

  void dispose() {
    username.dispose();
    fullName.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    macAddress.dispose();
    referral.dispose();
    referralSource.dispose();
  }
}
