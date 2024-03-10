
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/add_feature/data/cost_params.dart';
import 'package:poolino/features/add_feature/domain/entities/add_cost_entity.dart';

import '../../../../../config/use_case/use_case.dart';
import '../repository/add_cost_repository.dart';

class AddCostUseCase extends UseCase<DataState<AddCostEntity>, CostParams>{
  final AddCostRepository addCostRepository;
  AddCostUseCase(this.addCostRepository);

  @override
  Future<DataState<AddCostEntity>> call(CostParams param) {
    return addCostRepository.saveCostDetails(param);
  }
  
}