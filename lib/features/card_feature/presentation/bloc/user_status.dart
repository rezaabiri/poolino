


import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';

abstract class UserStatus{}
class LoadingInitial extends UserStatus{}
class UserLoading extends UserStatus{}
class UserComplete extends UserStatus{
  final UserEntity userEntity;
  UserComplete(this.userEntity);
}
class UserError extends UserStatus{
  final String message;
  UserError(this.message);
}
class UserLogOut extends UserStatus{
  final String message;
  UserLogOut(this.message);
}