import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_button_state.dart';

class LoginButtonCubit extends Cubit<LoginButtonState> {
  LoginButtonCubit() : super(LoginButtonState(isCorrect: false));

  void changeState(bool isCorrect){
    emit(LoginButtonState(isCorrect: isCorrect));
  }
}
