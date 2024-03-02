import 'package:bloc/bloc.dart';

part 'verify_pinput_state.dart';

class VerifyPinPut extends Cubit<VerifyPinPutState> {
  VerifyPinPut() : super(VerifyPinPutState(isCorrect: false));

  void changeState(bool isCorrect) {
    emit(VerifyPinPutState(isCorrect: isCorrect));
  }
}