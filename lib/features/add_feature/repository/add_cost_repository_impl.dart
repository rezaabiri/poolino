import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/add_feature/data/cost_params.dart';

import '../data/add_cost_api_provider.dart';
import '../domain/entities/add_cost_entity.dart';
import '../domain/repository/add_cost_repository.dart';
import '../models/add_cost_model.dart';



class AddCostRepositoryImpl extends AddCostRepository {
  AddCostApiProvider apiProvider;

  AddCostRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<AddCostEntity>> saveCostDetails(CostParams costParams) async {
    try {

      Response response;
      response = await apiProvider.saveCost(
        costParams.price,
        costParams.date,
        costParams.category,
        costParams.priority,
        costParams.description
      );

      AddCostEntity addCostEntity = AddCostModel.fromJson(response.data);
      return DataSuccess(addCostEntity);

    }on AppException catch (e){
      final errorDataState = await CheckExceptions.getError(e);
      return DataFailed<AddCostEntity>(errorDataState.error);
    }
  }



}
