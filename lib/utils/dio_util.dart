import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'flex_util.dart';

mixin DioUtil {
  Future<Response<dynamic>> dioSuccessHandler(Response response) async {
    debugPrint("------------------ ${response.statusMessage}");
    debugPrint(response.statusCode.toString());
    debugPrint(response.statusCode.toString());
    debugPrint(response.data.toString());

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        if (response.data['message'] != null &&
            response.data['message'].toString().contains('authentication')) {
          await FlexUtil.logout();
        }
        // if (response.body['error'] != null) {
        //   throw response.body['error'];
        // }
        return response;
      case 500:
        throw response.data['message'] ??
            (response.statusMessage ?? "Internal Server Error");
      case 403:
        throw "Error occured.. Pls check your internet and retry";
      case 422:
        if (response.data['message'] != null &&
            response.data['message']
                .toString()
                .contains('authentication failed')) {
          await FlexUtil.logout();
        }

        throw response.data['message'] ?? 'Unprocessable Entity';
      default:
        throw response.data == null
            ? "Error Unknown.. Pls check your internet and retry "
            : response.data['message'];
    }
  }

  Future<Exception> dioErrorHandler(DioException e) async {
    debugPrint("---------- ${e.toString()} ..............");
    debugPrint(e.response?.data.toString());
    debugPrint(e.response?.statusCode.toString());
    debugPrint(e.response?.statusMessage);
    debugPrint(e.response?.data.toString());
    switch (e.type) {
      case DioExceptionType.badResponse:
        if (e.response?.data.toString().contains("<html") == true) {
          throw "System error... Try Again";
        }
        if (e.response?.data['message'] != null &&
            e.response?.data['message'].contains('authentication failed')) {
          await FlexUtil.logout();
        }
        throw e.response?.data['message'] ?? "something went wrong";

      case DioExceptionType.connectionTimeout:
        throw "connection timeout";

      case DioExceptionType.receiveTimeout:
        throw 'receiving timeout';

      case DioExceptionType.unknown:
        if (e.response?.data.toString().contains("<html") == true) {
          throw "System error... Try Again";
        }
        if (e.response?.data['message'] != null &&
            e.response?.data['message'].contains('authentication failed')) {
          await FlexUtil.logout();
        }
        throw 'Something went wrong';

      case DioExceptionType.badCertificate:
        throw 'bad certificate';

      case DioExceptionType.sendTimeout:
        throw 'send timeout';

      default:
        throw "Error Unknown.. Pls check your internet and retry ";
    }
  }
}
