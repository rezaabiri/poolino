import 'package:dio/dio.dart';


class ApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> login(email, password) async {
    var response = await _dio.post(
      "https://poolinoapp.offerja.ir/poolino_ftp/public/api/auth/login",
      data: {
        'email': email,
        'password':password
      }
    );
    print(response.data);
    return response;
  }
}