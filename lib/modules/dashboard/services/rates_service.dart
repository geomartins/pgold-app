import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:pgold/utils/dio_util.dart';

class RatesService with DioUtil {
  final Dio _dio = Dio();

  Future<Response> getGiftCards() async {
    final baseUrl = dotenv.env['APP_BASE_URL'];

    try {
      Response response = await _dio.get(
        "$baseUrl/api/rates/gift-cards",
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      return dioSuccessHandler(response);
    } on DioException catch (e) {
      throw await dioErrorHandler(e);
    }
  }

  Future<Response> getCryptos() async {
    final baseUrl = dotenv.env['APP_BASE_URL'];

    try {
      Response response = await _dio.get(
        "$baseUrl/api/rates/crypto",
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      return dioSuccessHandler(response);
    } on DioException catch (e) {
      throw await dioErrorHandler(e);
    }
  }
}
