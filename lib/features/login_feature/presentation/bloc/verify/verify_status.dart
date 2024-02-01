import 'package:poolino/common/base_model.dart';

import '../../../domain/entities/verify_entity.dart';

abstract class VerifyStatus{}
class LoadingInitial extends VerifyStatus{}
class VerifyLoading extends VerifyStatus{}
class VerifyComplete extends VerifyStatus{
  final VerifyEntity verifyEntity;
  VerifyComplete(this.verifyEntity);
}
class VerifyError extends VerifyStatus{
  final String message;
  VerifyError(this.message);
}