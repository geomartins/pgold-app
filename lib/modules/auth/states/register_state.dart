import 'package:get/get.dart';

class RegisterState {
  final username = ''.obs;
  final fullName = ''.obs;
  final phone = ''.obs;
  final countryCode = ''.obs;
  final countryISOCode = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final passwordConfirmation = ''.obs;
  final macAddress = ''.obs;
  final referral = ''.obs;
  final referralSource = ''.obs;

  final isLoading = false.obs;
  final errors = <String, String>{}.obs;
}
