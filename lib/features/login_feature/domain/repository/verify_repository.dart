
import 'package:poolino/common/base_model.dart';
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/params/verify_params.dart';
import 'package:poolino/features/login_feature/domain/entities/verify_entity.dart';

import '../../../../common/resources/data_state.dart';
import '../entities/login_entity.dart';

abstract class VerifyRepository {
  Future<DataState<VerifyEntity>> fetchVerify(VerifyParams verifyParams);
}