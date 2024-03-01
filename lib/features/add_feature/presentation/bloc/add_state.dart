part of 'add_bloc.dart';

@immutable
 class AddState {
  final AddStatus addStatus;

  const AddState({required this.addStatus});

  AddState copyWith({
    AddStatus? newAddStatus
}){
    return AddState(addStatus: newAddStatus ?? addStatus);
  }
}
