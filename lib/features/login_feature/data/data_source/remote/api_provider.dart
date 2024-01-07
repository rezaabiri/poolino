
import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/check_exception.dart';



class ApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> login(email, password) async {

    var response = await _dio.post(
      "https://poolinoapp.offerja.ir/poolino_ftp/public/api/auth/login",
      data: {
        'email': email,
        'password':password
      }
    ).onError((DioError error, stackTrace){
      return CheckExceptions.response(error.response!);
    });
    print(response.data);
    return response;
  }
}