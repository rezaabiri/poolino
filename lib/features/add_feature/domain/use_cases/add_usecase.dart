
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/domain/repository/user_repository.dart';

import '../../../../../config/use_case/use_case.dart';

class AddUseCase extends UseCase<DataState<UserEntity>, String>{
  final AddRepository addRepository;
  AddUseCase(this.addRepository);

  @override
  Future<DataState<UserEntity>> call(String number) {
    return addRepository.fetchUserDetails(number);
  }
  
}