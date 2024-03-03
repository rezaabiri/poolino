import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/add_feature/data/cost_params.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/domain/repository/user_repository.dart';
import 'package:poolino/features/card_feature/models/user_model.dart';

import '../../card_feature/data/user_api_provider.dart';


class AddRepositoryImpl extends AddRepository {
  AddApiProvider apiProvider;

  AddRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<UserEntity>> saveCostDetails(CostParams costParams) async {
    try {

      Response response;
      response = await apiProvider.saveCost(
        costParams.price,
        costParams.date,
        costParams.category,
        costParams.priority,
        costParams.description
      );

      UserEntity userEntity = UserModel.fromJson(response.data);
      return DataSuccess(userEntity);

    }on AppException catch (e){
      final errorDataState = await CheckExceptions.getError(e);
      return DataFailed<UserEntity>(errorDataState.error);
    }
  }



}
