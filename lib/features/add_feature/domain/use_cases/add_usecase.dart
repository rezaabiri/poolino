
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/add_feature/data/cost_params.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/domain/repository/user_repository.dart';

import '../../../../../config/use_case/use_case.dart';

class AddUseCase extends UseCase<DataState<UserEntity>, CostParams>{
  final AddRepository addRepository;
  AddUseCase(this.addRepository);

  @override
  Future<DataState<UserEntity>> call(CostParams param) {
    return addRepository.saveCostDetails(param);
  }
  
}