
import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/error_handler/jwt/base_api_provider.dart';

import '../../../common/utils/constants.dart';


class AddApiProvider extends BaseApiProvider{
  Future<dynamic> sendData(email) async {
    var response = await dio.post(
      Constants.baseUrl + Constants.getUserDetails,
      data: {'email': email},
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

}