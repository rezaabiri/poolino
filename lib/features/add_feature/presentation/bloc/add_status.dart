


import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';

abstract class AddStatus{}
class LoadingInitial extends AddStatus{}
class AddLoading extends AddStatus{}
class AddComplete extends AddStatus{
  final UserEntity userEntity;
  AddComplete(this.userEntity);
}
class AddError extends AddStatus{
  final String message;
  AddError(this.message);
}