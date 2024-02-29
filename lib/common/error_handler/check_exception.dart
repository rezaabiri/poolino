
import 'package:dio/dio.dart';

import '../resources/data_state.dart';
import 'app_exception.dart';

class CheckExceptions {
  static int refreshAttempts = 0;

  static dynamic response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        String errorMessage = response.data['message'];
        throw BadRequestException(response: response, message: errorMessage);
      /*case 403:
        String errorMessage = response.data['message'];
        throw UnauthorisedException(message: errorMessage);*/
      case 407:
        String errorMessage = response.data['message'];
        throw TokenNotFoundException(message: errorMessage);
      case 404:
        String errorMessage = response.data['message'];
        throw NotFoundException(message: errorMessage);
      case 500:
        throw ServerException();
      case 406:
        String errorMessage = response.data['message'];
        throw Error406Exception(message: errorMessage);
      default:
        throw FetchDataException(message: "logout");
    }
  }

  static dynamic getError(AppException appException) async {
    switch (appException.runtimeType) {
      case BadRequestException:
        return DataFailed(appException.message);
      case NotFoundException:
        return DataFailed(appException.message);
      /*case UnauthorisedException:
        return DataFailed(appException.message);*/
      case ServerException:
        return DataFailed(appException.message);
      case FetchDataException:
        return DataFailed(appException.message);
      case Error406Exception:
        return DataFailed(appException.message);
      case TokenNotFoundException:
        return DataFailed(appException.message);
      default:
        return DataFailed(appException.message);
    }
  }

}