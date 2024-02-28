
import 'dart:io';

import 'package:android_sms_retriever/android_sms_retriever.dart';
import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/check_exception.dart';

import '../../../common/utils/constants.dart';



class ApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> login(email, password) async {
    var response = await _dio.post(
        Constants.baseUrl+Constants.login,
        data: {
          'email': email,
          'password':password,
          if(Platform.isAndroid)
            'signature': (await AndroidSmsRetriever.getAppSignature())
        }
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    print(response);
    print(await AndroidSmsRetriever.getAppSignature());
    return response;

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

    }on DioError catch (stack){
      CheckExceptions.response(stack.response!);
      //print(stack.response!);
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