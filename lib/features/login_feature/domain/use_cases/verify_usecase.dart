
import 'package:poolino/common/base_model.dart';
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';

import '../../../../../config/use_case/use_case.dart';
import '../../../../common/params/verify_params.dart';
import '../entities/login_entity.dart';
import '../entities/verify_entity.dart';
import '../repository/login_repository.dart';
import '../repository/verify_repository.dart';

class VerifyUseCase extends UseCase<DataState<VerifyEntity>, VerifyParams>{
  final VerifyRepository verifyRepository;
  VerifyUseCase(this.verifyRepository);

  @override
  Future<DataState<VerifyEntity>> call(VerifyParams param) {
    return verifyRepository.fetchVerify(param);
  }
  
}