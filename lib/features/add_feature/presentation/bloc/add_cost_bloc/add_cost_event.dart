part of 'add_cost_bloc.dart';

@immutable
class AddCostEvent {}
class LoadAddEvent extends AddCostEvent{
  CostParams params;
  LoadAddEvent(this.params);
}
