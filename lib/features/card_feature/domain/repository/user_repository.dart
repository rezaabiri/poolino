
import 'package:poolino/features/add_feature/data/cost_params.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';

import '../../../../common/resources/data_state.dart';

abstract class AddRepository {
  Future<DataState<UserEntity>> saveCostDetails(CostParams costParams);
}