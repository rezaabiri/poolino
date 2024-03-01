import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/presentation/bloc/user_status.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';

import '../../../../common/resources/data_state.dart';
import '../../domain/use_cases/user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class AddBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  AddBloc(this.userUseCase) : super(UserState(userStatus: LoadingInitial())) {
    on<LoadUserEvent>((event, emit) async {
      emit(state.copyWith(newUserStatus: UserLoading()));

      DataState<UserEntity> dataState = await userUseCase(event.number);
      if(dataState is DataSuccess){
        emit(state.copyWith(newUserStatus: AddComplete(dataState.data!)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newUserStatus: AddError(dataState.error!)));
      }

      if(dataState is DataLogOut){
        emit(state.copyWith(newUserStatus: UserLogOut(dataState.error!)));
      }
    });
  }
}
