
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/domain/repository/user_repository.dart';

import '../../../../../config/use_case/use_case.dart';

class UserUseCase extends UseCase<DataState<UserEntity>, String>{
  final AddRepository userRepository;
  UserUseCase(this.userRepository);

  @override
  Future<DataState<UserEntity>> call(String number) {
    return userRepository.fetchUserDetails(number);
  }
  
}