import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/features/add_feature/data/income_params.dart';
import '../../../../../common/resources/data_state.dart';
import '../../../domain/entities/add_income_entity.dart';
import '../../../domain/use_cases/add_income_usecase.dart';
import 'add_income_status.dart';
part 'add_income_event.dart';
part 'add_income_state.dart';

class AddIncomeBloc extends Bloc<AddIncomeEvent, AddIncomeState> {
  final AddIncomeUseCase addUseCase;

  AddIncomeBloc(this.addUseCase) : super(AddIncomeState(addStatus: LoadingInitial())) {
    on<LoadAddIncomeEvent>((event, emit) async {
      emit(state.copyWith(newAddStatus: AddIncomeLoading()));

      DataState<AddIncomeEntity> dataState = await addUseCase(event.params);
      if(dataState is DataSuccess){
        emit(state.copyWith(newAddStatus: AddIncomeComplete(dataState.data!)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newAddStatus: AddIncomeError(dataState.error!)));
      }

    });
  }
}
