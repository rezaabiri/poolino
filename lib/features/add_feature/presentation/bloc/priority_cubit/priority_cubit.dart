import 'package:bloc/bloc.dart';

part 'priority_state.dart';

class PriorityCubit extends Cubit<PriorityState> {
  PriorityCubit() : super(PriorityState(priority: "انتخاب کنید"));

  void changePriority(String priority){
    emit(PriorityState(priority: priority));
  }
}
