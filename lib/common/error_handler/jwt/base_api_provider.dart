import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/error_handler/jwt/refresh_token_repository.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/common/utils/prefs_opreator.dart';
import 'package:poolino/locator.dart';

import '../../utils/constants.dart';
import '../app_exception.dart';


class BaseApiProvider {
  final Dio dio = Dio();
  final PrefsOperator prefsOperator = locator<PrefsOperator>();
  BaseApiProvider() {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      responseHeader: true,
      requestHeader: true,
      requestBody: true,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        var token = await prefsOperator.getSharedData("accessToken");
        options.headers['Authorization'] = 'Bearer $token';
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
      onError: (DioError e, handler) async {
        if (e.response?.statusCode == 403) {
          try{
            DataState<String> dataState = await refreshToken();

            String newAccessToken = dataState.data.toString();

            log(newAccessToken);
            e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            return handler.resolve(await dio.fetch(e.requestOptions));
          }on AppException catch (e){
            final errorDataState = await CheckExceptions.getError(e);
            DataFailed<String>(errorDataState.error);
            return;
            //CheckExceptions.getError(e);
          }

        }
        return handler.next(e);
      },
    ));

  }
  Future<DataState<String>> refreshToken() async {

    var refreshToken = await prefsOperator.getSharedData("refreshToken");
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
    ));
    var response = await dio.post(
      Constants.baseUrl + Constants.refresh,
      data: {'refreshToken': refreshToken},
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    String refresh = response.data['result']['refresh_token'];
    String access = response.data['result']['access_token'];
    prefsOperator.setSharedData("accessToken", access);
    prefsOperator.setSharedData("refreshToken", refresh);
    return DataSuccess(access);
  }

}
