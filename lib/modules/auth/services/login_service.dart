import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:pgold/utils/dio_util.dart';

class LoginService with DioUtil {
  Future<Response> login(String email, String password, String macAddress,
      String deviceInfo) async {
    final baseUrl = dotenv.env['APP_BASE_URL'];
    final clientSecret = dotenv.env['APP_CLIENT_SECRET'];

    try {
      Response response = await Dio().post(
        "$baseUrl/api/auth/login",
        data: {
          "email": email.trim(),
          "password": password.trim(),
          "mac_address": macAddress.trim(),
          "client_secret": clientSecret,
          "device_info": deviceInfo,
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
