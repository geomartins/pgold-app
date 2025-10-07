import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:pgold/utils/dio_util.dart';

class RegisterService with DioUtil {
  Future<Response> searchUsername(String username) async {
    final baseUrl = dotenv.env['APP_BASE_URL'];
    try {
      Response response = await Dio().post(
        "$baseUrl/api/auth/check-username",
        data: {
          "username": username.trim(),
        },
      );
      return dioSuccessHandler(response);
    } on DioException catch (e) {
      throw await dioErrorHandler(e);
    }
  }

  Future<Response> register(
      {required String username,
      required String fullName,
      required String phone,
      required String countryCode,
      required String countryISOCode,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String macAddress,
      String referral = '',
      String referralSource = ''}) async {
    final baseUrl = dotenv.env['APP_BASE_URL'];

    try {
      Response response = await Dio().post(
        "$baseUrl/api/auth/register",
        data: {
          "username": username.trim(),
          "fullname": fullName.trim(),
          "password": password.trim(),
          "password_confirmation": passwordConfirmation.trim(),
          "phone": phone.trim(),
          "country_code": countryCode.trim(),
          "country_iso_code": countryISOCode.trim(),
          "email": email.trim(),
          "referral": referral.trim(),
          "referral_source": referralSource.trim(),
          "mac_address": macAddress.trim()
        },
        options: Options(
          headers: {
            //'Authorization': 'Bearer $token',
          },
        ),
      );

      return dioSuccessHandler(response);
    } on DioException catch (e) {
      throw await dioErrorHandler(e);
    }
  }
}
