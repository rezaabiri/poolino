import 'package:bloc/bloc.dart';

part 'verify_button_state.dart';

class VerifyButtonCubit extends Cubit<VerifyButtonState> {
  VerifyButtonCubit() : super(VerifyButtonState(isCorrect: false));

  void changeState(bool isCorrect) {
    emit(VerifyButtonState(isCorrect: isCorrect));
  }
}