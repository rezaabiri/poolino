import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/domain/repository/user_repository.dart';
import 'package:poolino/features/card_feature/models/user_model.dart';
import 'package:poolino/features/login_feature/models/login_model.dart';
import '../data/user_api_provider.dart';


class UserRepositoryImpl extends UserRepository {
  UserApiProvider apiProvider;

  UserRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<UserEntity>> fetchUserDetails(String number) async {
    try {

      Response response;
      response = await apiProvider.getUserDetails(
        number,
      );

      UserEntity userEntity = UserModel.fromJson(response.data);
      return DataSuccess(userEntity);

    }on AppException catch (e){
      final errorDataState = await CheckExceptions.getError(e);
      return DataFailed<UserEntity>(errorDataState.error);
    }
  }



}
