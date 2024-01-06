part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoadLoginEvent extends LoginEvent{
  final LoginParams loginParams;
  LoadLoginEvent(this.loginParams);
}
