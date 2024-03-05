import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';

import '../../../../../common/resources/data_state.dart';
import '../../../data/cost_params.dart';
import '../../../domain/use_cases/add_usecase.dart';
import 'add_cost_status.dart';

part 'add_cost_event.dart';
part 'add_cost_state.dart';

class AddCostBloc extends Bloc<AddCostEvent, AddCostState> {
  final AddUseCase addUseCase;

  AddCostBloc(this.addUseCase) : super(AddCostState(addStatus: LoadingInitial())) {
    on<LoadAddEvent>((event, emit) async {
      emit(state.copyWith(newAddStatus: AddCostLoading()));

      DataState<UserEntity> dataState = await addUseCase(event.params);
      if(dataState is DataSuccess){
        emit(state.copyWith(newAddStatus: AddCostComplete(dataState.data!)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newAddStatus: AddCostError(dataState.error!)));
      }

    });
  }
}
