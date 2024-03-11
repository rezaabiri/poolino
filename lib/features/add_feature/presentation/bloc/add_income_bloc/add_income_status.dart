
import '../../../domain/entities/add_cost_entity.dart';
import '../../../domain/entities/add_income_entity.dart';

abstract class AddIncomeStatus{}
class LoadingInitial extends AddIncomeStatus{}
class AddIncomeLoading extends AddIncomeStatus{}
class AddIncomeComplete extends AddIncomeStatus{
  final AddIncomeEntity addIncomeEntity;
  AddIncomeComplete(this.addIncomeEntity);
}
class AddIncomeError extends AddIncomeStatus{
  final String message;
  AddIncomeError(this.message);
}