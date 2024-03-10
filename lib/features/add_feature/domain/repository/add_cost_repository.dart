
import 'package:poolino/features/add_feature/domain/entities/add_cost_entity.dart';

import '../../../../common/resources/data_state.dart';
import '../../data/cost_params.dart';

abstract class AddCostRepository {
  Future<DataState<AddCostEntity>> saveCostDetails(CostParams costParams);
}