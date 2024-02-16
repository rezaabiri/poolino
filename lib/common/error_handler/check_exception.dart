
import 'package:dio/dio.dart';
import 'package:poolino/locator.dart';
import '../../features/login_feature/domain/entities/verify_entity.dart';
import '../constants.dart';
import '../resources/data_state.dart';
import '../utils/prefs_opreator.dart';
import 'app_exception.dart';

class CheckExceptions {
  static int refreshAttempts = 0;

  static dynamic response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response: response);
      case 403:
        if (refreshAttempts < 2) {
          refreshToken();
          //return repeatRequestWithNewToken();
        } else {
          return DataFailed("khata");
        }
        //throw UnauthorisedException();
      case 402:
        throw TokenNotFoundException(message: "token peyda nashod");
      case 404:
        throw NotFoundException();
      case 500:
        return DataFailed(response.statusMessage);
        throw ServerException();
      case 406:
        throw Error406Exception(message: response.statusMessage);
      default:
        throw FetchDataException(message: "${response.statusCode}fetch exception");
    }
  }

  static dynamic getError(AppException appException) async {
    switch (appException.runtimeType) {
      case BadRequestException:
        return DataFailed(appException.message);

      case NotFoundException:
        return DataFailed(appException.message);
      case UnauthorisedException:
        if (refreshAttempts < 2) {
          await refreshToken();
        } else {
          return DataFailed(appException.message);
        }

      case ServerException:
        return DataFailed(appException.message);

      case FetchDataException:
        return DataFailed(appException.message);

      case Error406Exception:
        return DataFailed(appException.message +"رضا عبیری");
      default:
        return DataFailed(appException.message);
    }
  }

  static Future<void> refreshToken() async {


    Dio dio = locator<Dio>();
    PrefsOperator prefsOperator = locator<PrefsOperator>();

    var accessToken = await prefsOperator.getSharedData("accessToken");
    var refreshToken = await prefsOperator.getSharedData("refreshToken");
    Response response = await dio.post(Constants.baseUrl+Constants.refresh,
        options: Options(
          contentType: "application/json"
        ),
        data: {
      'token': refreshToken}
    );


    String newToken = response.data['result'];
    prefsOperator.setSharedData("accessToken", newToken);
    print(prefsOperator.getSharedData("accessToken"));
    refreshAttempts = 0;

    /*  try {
      Dio dio = locator<Dio>();
      PrefsOperator prefsOperator = locator<PrefsOperator>();

      Response response = await dio.post(Constants.baseUrl+Constants.refresh,
          data: {'refresh_token': prefsOperator.getSharedData("accessToken")}
      );

      print("callrefresh"+response.data);

      String newToken = response.data['new_token'];
      refreshAttempts = 0;
    } catch (error) {
      refreshAttempts++;
      print("errororo"+error.toString());
      //throw FetchDataException(message: 'Failed to refresh token');
    }*/
  }

  /*static Future<Response> repeatRequestWithNewToken() async {
    try {
      Dio dio = locator<Dio>();
      PrefsOperator prefsOperator = locator<PrefsOperator>();

      dio.options.headers['Authorization'] = 'Bearer '; // newToken از refreshToken گرفته شده
      Response response = await dio.get('url');
      return response;
    } catch (error) {
      return
      //throw FetchDataException(message: 'Failed to repeat request with new token');
    }
  }*/
}