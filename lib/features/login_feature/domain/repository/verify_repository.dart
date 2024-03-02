
import 'package:poolino/common/params/verify_params.dart';
import 'package:poolino/features/login_feature/domain/entities/verify_entity.dart';

import '../../../../common/resources/data_state.dart';

abstract class VerifyRepository {
  Future<DataState<VerifyEntity>> fetchVerify(VerifyParams verifyParams);
}