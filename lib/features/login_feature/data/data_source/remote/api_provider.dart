
import 'package:dio/dio.dart';
import 'package:poolino/common/constants.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';



class ApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> login(email, password) async {

    try{
      var response = await _dio.post(
          Constants.baseUrl+Constants.login,
          data: {
            'email': email,
            'password':password
          }
      );
      return response;

    }on DioError catch (stack, error){
      CheckExceptions.response(stack.response!);

      print(stack.response!);
    }
    /*var response = await _dio.post(
      Constants.baseUrl+Constants.login,
      data: {
        'email': email,
        'password':password
      }
    ).onError((DioError error, stackTrace){
      print(error.response!);
      return CheckExceptions.response(error.response!);
    });*/
  }
  Future<dynamic> verify(email, code) async {

    try{
      var response = await _dio.post(
          Constants.baseUrl+Constants.verify,
          data: {
            'email': email,
            'code':code
          }
      );
      return response;

    }on DioError catch (stack, error){
      CheckExceptions.response(stack.response!);

      print(stack.response!);
    }
    /*var response = await _dio.post(
      Constants.baseUrl+Constants.login,
      data: {
        'email': email,
        'password':password
      }
    ).onError((DioError error, stackTrace){
      print(error.response!);
      return CheckExceptions.response(error.response!);
    });*/
  }
}