import 'package:dio/dio.dart';

import 'app_exception.dart';

class ErrorHandler {
  static Future<Response> handleResponseError(Response response) async {
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 403) {
      print("not implemented error 403");
      return _retryWithNewToken(response);
    } else {
      return _handleOtherErrors(response);
    }
  }

  static Future<Response> _retryWithNewToken(Response response) async {
    // عملیات رفرش توکن و اجرای درخواست قبلی با توکن جدید
    // مثال: ارسال درخواست رفرش توکن و دریافت توکن جدید
    throw UnimplementedError("_retryWithNewToken method is not implemented");
  }

  static Future<Response> _handleOtherErrors(Response response) async {
    switch (response.statusCode) {
      case 400:
      //PoolinoSnackBar(icon: , type: Constants.ERROR).show(context, "message");
        throw BadRequestException(message: "Bad request", response: response);
      case 402:
        throw TokenNotFoundException(message: "token peyda nashod");
      case 404:
        throw NotFoundException();
      case 500:
        print("khata 500 mide ke moshkel dare");
        throw ServerException();
      case 406:
        throw Error406Exception(message: response.statusMessage);
      default:
        throw FetchDataException(message: "${response.statusCode}fetch exception");
    }
  }
}
