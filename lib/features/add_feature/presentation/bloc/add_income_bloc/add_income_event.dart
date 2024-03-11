part of 'add_income_bloc.dart';

@immutable
class AddIncomeEvent {}
class LoadAddIncomeEvent extends AddIncomeEvent{
  IncomeParams params;
  LoadAddIncomeEvent(this.params);
}
