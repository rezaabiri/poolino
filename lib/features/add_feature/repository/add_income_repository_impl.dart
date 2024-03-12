import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/add_feature/data/cost_params.dart';
import 'package:poolino/features/add_feature/data/income_params.dart';
import 'package:poolino/features/add_feature/domain/entities/add_income_entity.dart';

import '../data/add_cost_api_provider.dart';
import '../data/add_income_api_provider.dart';
import '../domain/entities/add_cost_entity.dart';
import '../domain/repository/add_cost_repository.dart';
import '../domain/repository/add_income_repository.dart';
import '../models/add_income_model.dart';



class AddIncomeRepositoryImpl extends AddIncomeRepository {
  AddIncomeApiProvider apiProvider;

  AddIncomeRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<AddIncomeEntity>> saveIncomeDetails(IncomeParams incomeParams) async {
    try {

      Response response;
      response = await apiProvider.saveIncome(
          incomeParams.price,
          incomeParams.date,
          incomeParams.category,
          incomeParams.description
      );

      AddIncomeEntity addIncomeEntity = AddIncomeModel.fromJson(response.data);
      return DataSuccess(addIncomeEntity);

    }on AppException catch (e){
      final errorDataState = await CheckExceptions.getError(e);
      return DataFailed<AddIncomeEntity>(errorDataState.error);
    }
  }



}
