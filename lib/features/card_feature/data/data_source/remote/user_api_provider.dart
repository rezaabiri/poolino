
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:poolino/common/constants.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:android_sms_retriever/android_sms_retriever.dart';



class UserApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> getUserDetails(email) async {
    var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YjFkNjUyYy1lMjQzLTQxM2EtOTFhNi0zMjZkMDY1NTBjNjciLCJqdGkiOiJiY2Y5NTE0YjJhNGY3YzM0YTE2NjY4YjQ2Njg1OWVjYjcwMjM0M2Q0ZjgyYjA4YjlhYmVmMzk3YzRiOWU2OTM1NzFjNDUzNWVmNjA3YzJmZiIsImlhdCI6MTcwODA3NDY2MS42MDcyMTIsIm5iZiI6MTcwODA3NDY2MS42MDcyMTUsImV4cCI6MTcwODA3NjQ2MS41OTg4OCwic3ViIjoiMzgiLCJzY29wZXMiOltdfQ.czBeh7R8_X5lAcWjtPxebE8I4EislQWYsP9wRUrph5YoHPE3yTnx2VbtJvITPw6LtREJkBPzR5GmOfA0cFltXreq9Hwi2Zs488ND6HFi4E35CBoXV0pSkebK8tquSQ2N-QdtXIzOOCRVxPJ96w1_NLgQexqwrrCMzcvUNrBeFaYwx_Oh9dSzRvKfWV-U2yz8PBE_H7cwkncfexXYeNUM22LFKzJZZMUC9v88NLFm3Wu-6sbIQNS7wMijxaqmDQNkJBy-iyM52ASdbId-dICV3-LNQxSe1iU8pafBgjGeWdsiKio8WHIYk6Lbbz4bzQd9Ffrls2YXA387TtsJDBvL1wdbuay9298gH_ZoRj9EOh7lbiGKZLXlm2FVv8hBeRfx2prlZtqIrDzHQqBxbBbO9p31ul0Z9clo-4SGbZHhfkul2dwjZk1VwHsbDkSnNiYl_zYwyCFf7LJJdC6lZqOuyy9VT9H5mN6fwk2QFYKudmtUHuNqVayMhnYyLYgCEpeUALIQ5DMLp_96Ke3HtRSC-2n_nTwyu_dfrJDwP17-jBBawmmQwTR8O-e_FIs5D8Pn1aI_FXZEvHSaN5-aV8ARrARqLegawEVsElOWl3L8D-BB-9VwoR6T6z8j1zknDnrIG7Ub3dIkAVoH2Q42moOiPw_AsHXqVSFqICnJu00cUMo";
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers['Authorization'] = 'Bearer $token';
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
    ));

    var response = await _dio.post(
        Constants.baseUrl+Constants.getUserDetails,
        data: {
          'email': email
        }
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    print(response);
    return response;

    try{



    }on DioError catch (error){
      print(error.response!);
      CheckExceptions.response(error.response!);

    }

  }
}