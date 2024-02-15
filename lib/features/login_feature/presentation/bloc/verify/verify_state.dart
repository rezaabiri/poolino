part of 'verify_bloc.dart';

@immutable
class VerifyState {
  final VerifyStatus verifyStatus;

  const VerifyState({required this.verifyStatus});

  VerifyState copyWith({VerifyStatus? newVerifyStatus}){
    return VerifyState(verifyStatus: newVerifyStatus ?? verifyStatus);
  }
}
