import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_button_state.dart';

class VerifyButton extends Cubit<VerifyButtonState> {
  VerifyButton() : super(VerifyButtonState(isCorrect: false));

  void changeState(bool isCorrect) {
    emit(VerifyButtonState(isCorrect: isCorrect));
  }
}