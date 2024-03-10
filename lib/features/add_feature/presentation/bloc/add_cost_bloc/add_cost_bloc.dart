import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../common/resources/data_state.dart';
import '../../../data/cost_params.dart';
import '../../../domain/entities/add_cost_entity.dart';
import '../../../domain/use_cases/add_cost_usecase.dart';
import 'add_cost_status.dart';

part 'add_cost_event.dart';
part 'add_cost_state.dart';

class AddCostBloc extends Bloc<AddCostEvent, AddCostState> {
  final AddCostUseCase addUseCase;

  AddCostBloc(this.addUseCase) : super(AddCostState(addStatus: LoadingInitial())) {
    on<LoadAddEvent>((event, emit) async {
      emit(state.copyWith(newAddStatus: AddCostLoading()));

      DataState<AddCostEntity> dataState = await addUseCase(event.params);
      if(dataState is DataSuccess){
        emit(state.copyWith(newAddStatus: AddCostComplete(dataState.data!)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newAddStatus: AddCostError(dataState.error!)));
      }

    });
  }
}
