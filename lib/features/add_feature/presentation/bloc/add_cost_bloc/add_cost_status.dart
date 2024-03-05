


import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';

abstract class AddCostStatus{}
class LoadingInitial extends AddCostStatus{}
class AddCostLoading extends AddCostStatus{}
class AddCostComplete extends AddCostStatus{
  final UserEntity userEntity;
  AddCostComplete(this.userEntity);
}
class AddCostError extends AddCostStatus{
  final String message;
  AddCostError(this.message);
}