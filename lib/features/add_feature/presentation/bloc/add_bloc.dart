import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';
import 'package:poolino/features/card_feature/presentation/bloc/user_status.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';

import '../../../../common/resources/data_state.dart';
import '../../domain/use_cases/add_usecase.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final AddUseCase addUseCase;

  AddBloc(this.addUseCase) : super(AddState(addStatus: LoadingInitial())) {
    on<LoadAddEvent>((event, emit) async {
      emit(state.copyWith(newAddStatus: UserLoading()));

      DataState<UserEntity> dataState = await addUseCase(event.number);
      if(dataState is DataSuccess){
        emit(state.copyWith(newAddStatus: AddComplete(dataState.data!)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newAddStatus: AddError(dataState.error!)));
      }

    });
  }
}
