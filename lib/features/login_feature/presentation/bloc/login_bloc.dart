import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/common/params/login_params.dart';
import 'package:poolino/common/resources/data_state.dart';

import '../../domain/use_cases/login_usecase.dart';
import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginState(loginStatus: LoadingInitial())){
    on<LoadLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoginLoading()));
      DataState dataState = await loginUseCase(event.loginParams);
      if(dataState is DataSuccess){
        emit(state.copyWith(newLoginStatus: LoginComplete(dataState.data)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newLoginStatus: LoginError(dataState.error!)));
      }
    });
  }

}
