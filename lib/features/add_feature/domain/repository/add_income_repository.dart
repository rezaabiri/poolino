
import 'package:poolino/features/add_feature/data/income_params.dart';
import 'package:poolino/features/add_feature/domain/entities/add_cost_entity.dart';
import 'package:poolino/features/add_feature/domain/entities/add_income_entity.dart';

import '../../../../common/resources/data_state.dart';
import '../../data/cost_params.dart';

abstract class AddIncomeRepository {
  Future<DataState<AddIncomeEntity>> saveIncomeDetails(IncomeParams incomeParams);
}