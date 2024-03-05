part of 'add_cost_bloc.dart';

@immutable
 class AddCostState {
  final AddCostStatus addStatus;

  const AddCostState({required this.addStatus});

  AddCostState copyWith({AddCostStatus? newAddStatus}){
    return AddCostState(addStatus: newAddStatus ?? addStatus);
  }
}
