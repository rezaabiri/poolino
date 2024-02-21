
import 'package:dio/dio.dart';
import 'package:poolino/common/constants.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/error_handler/jwt/base_api_provider.dart';


class UserApiProvider extends BaseApiProvider{
  Future<dynamic> getUserDetails(email) async {
    var response = await dio.post(
      Constants.baseUrl + Constants.getUserDetails,
      data: {'email': email},
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

}