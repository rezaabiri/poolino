



import '../../../domain/entities/add_cost_entity.dart';

abstract class AddCostStatus{}
class LoadingInitial extends AddCostStatus{}
class AddCostLoading extends AddCostStatus{}
class AddCostComplete extends AddCostStatus{
  final AddCostEntity addCostEntity;
  AddCostComplete(this.addCostEntity);
}
class AddCostError extends AddCostStatus{
  final String message;
  AddCostError(this.message);
}