part of 'user_bloc.dart';

@immutable
class UserEvent {}
class LoadUserEvent extends UserEvent{
  final String number;
  LoadUserEvent(this.number);
}
