
import 'package:dio/dio.dart';
import 'package:poolino/common/error_handler/app_exception.dart';
import 'package:poolino/common/error_handler/check_exception.dart';
import 'package:poolino/common/params/verify_params.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/features/login_feature/models/verify_model.dart';

import '../data/api_provider.dart';
import '../domain/entities/verify_entity.dart';
import '../domain/repository/verify_repository.dart';

class VerifyRepositoryImpl extends VerifyRepository {
  ApiProvider apiProvider;

  VerifyRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<VerifyEntity>> fetchVerify(VerifyParams verifyParams) async {

    try {
      Response response;
      response = await apiProvider.verify(verifyParams.phone, verifyParams.code);
      VerifyEntity verifyEntity = VerifyModel.fromJson(response.data);
      return DataSuccess(verifyEntity);
    }on AppException catch (e){
      final errorDataState = await CheckExceptions.getError(e);
      return DataFailed<VerifyEntity>(errorDataState.error);
    }
  }

}
