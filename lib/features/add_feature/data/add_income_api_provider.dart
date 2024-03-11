
import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/error_handler/jwt/base_api_provider.dart';

import '../../../common/utils/constants.dart';
import '../../../common/utils/prefs_opreator.dart';
import '../../../locator.dart';


class AddIncomeApiProvider extends BaseApiProvider{

  Future<dynamic> saveIncome(String price, String date, String category, String description) async {
    var response = await dio.post(
      Constants.baseUrl + Constants.addIncome,
      data: {
        //'userId':await prefsOperator.getSharedData("userId"),
        'price': price,
        'date':date,
        'category':category,
        'description':description

      },
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });
    return response;
  }

}