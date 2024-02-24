
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/login_feature/models/login_model.dart';

import '../../../common/error_handler/app_exception.dart';
import '../data/api_provider.dart';
import '../domain/entities/login_entity.dart';
import '../domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  ApiProvider apiProvider;

  LoginRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<LoginEntity>> fetchLogin(LoginParams loginParams) async {

    try {
      Response response;
      response = await apiProvider.login(
        loginParams.email,
        loginParams.password,
      );
      LoginEntity loginEntity = LoginModel.fromJson(response.data);
      return DataSuccess(loginEntity);
    }on AppException catch (e){
      final errorDataState = await CheckExceptions.getError(e);
      return DataFailed<LoginEntity>(errorDataState.error);
    }
  }
}
