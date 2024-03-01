part of 'add_bloc.dart';

@immutable
class AddEvent {}
class LoadAddEvent extends AddEvent{
  final String number;
  LoadAddEvent(this.number);
}
