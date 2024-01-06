

import '../../domain/entities/login_entity.dart';

abstract class LoginStatus{}
class LoginLoading extends LoginStatus{}
class LoginComplete extends LoginStatus{
  final LoginEntity loginEntity;
  LoginComplete(this.loginEntity);
}
class LoginError extends LoginStatus{
  final String message;
  LoginError(this.message);
}