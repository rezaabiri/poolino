
import 'package:poolino/common/params/login_params.dart';

import '../../../../common/resources/data_state.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<DataState<LoginEntity>> fetchLogin(LoginParams loginParams);
}