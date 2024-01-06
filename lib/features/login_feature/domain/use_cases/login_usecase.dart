
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';

import '../../../../../config/use_case/use_case.dart';
import '../entities/login_entity.dart';
import '../repository/login_repository.dart';

class LoginUseCase extends UseCase<DataState<LoginEntity>, LoginParams>{
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future<DataState<LoginEntity>> call(LoginParams param) {
    return loginRepository.fetchLogin(param);
  }
  
}