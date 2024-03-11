
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/add_feature/data/income_params.dart';
import 'package:poolino/features/add_feature/domain/entities/add_income_entity.dart';

import '../../../../../config/use_case/use_case.dart';
import '../repository/add_income_repository.dart';

class AddIncomeUseCase extends UseCase<DataState<AddIncomeEntity>, IncomeParams>{
  final AddIncomeRepository addIncomeRepository;
  AddIncomeUseCase(this.addIncomeRepository);

  @override
  Future<DataState<AddIncomeEntity>> call(IncomeParams param) {
    return addIncomeRepository.saveIncomeDetails(param);
  }
  
}