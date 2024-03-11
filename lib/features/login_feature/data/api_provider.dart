
import 'dart:io';

import 'package:android_sms_retriever/android_sms_retriever.dart';
import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/error_handler/jwt/base_api_provider.dart';
import 'package:poolino/common/resources/data_state.dart';

import '../../../common/utils/constants.dart';



class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> login(phone, password) async {
    try{
      var response = await _dio.post(
          Constants.baseUrl+Constants.login,
          data: {
            'phone': phone,
            'password':password,
            if(Platform.isAndroid)
              'signature': (await AndroidSmsRetriever.getAppSignature())
          }
      ).onError((DioError error, stackTrace) {
        return CheckExceptions.response(error.response!);
      });
      print(response);
      return response;
    }catch(e){
      return const DataFailed("وضعیت اینترنت خود را بررسی کنید");
    }


  }
  Future<dynamic> verify(phone, code) async {

    try{
      var response = await _dio.post(
          Constants.baseUrl+Constants.verify,
          data: {
            'phone': phone,
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