import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_status.dart';

import '../../../../../common/params/verify_params.dart';
import '../../../../../common/resources/data_state.dart';
import '../../../domain/use_cases/verify_usecase.dart';

part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final VerifyUseCase verifyUseCase;

  VerifyBloc(this.verifyUseCase) : super(VerifyState(verifyStatus: LoadingInitial())) {
    on<LoadVerifyEvent>((event, emit) async {
      emit(state.copyWith(newVerifyStatus: VerifyLoading()));
      DataState dataState = await verifyUseCase(event.verifyParams);
      if(dataState is DataSuccess){
        emit(state.copyWith(newVerifyStatus: VerifyComplete(dataState.data)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newVerifyStatus: VerifyError(dataState.error!)));
      }
    });
  }
}
