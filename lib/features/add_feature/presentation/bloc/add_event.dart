part of 'add_bloc.dart';

@immutable
class AddEvent {}
class LoadAddEvent extends AddEvent{
  CostParams params;
  LoadAddEvent(this.params);
}
