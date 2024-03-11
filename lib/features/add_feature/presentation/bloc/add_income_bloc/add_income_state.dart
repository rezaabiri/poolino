part of 'add_income_bloc.dart';

@immutable
 class AddIncomeState {
  final AddIncomeStatus addStatus;

  const AddIncomeState({required this.addStatus});

  AddIncomeState copyWith({AddIncomeStatus? newAddStatus}){
    return AddIncomeState(addStatus: newAddStatus ?? addStatus);
  }
}
