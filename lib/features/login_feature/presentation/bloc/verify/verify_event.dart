part of 'verify_bloc.dart';

@immutable
abstract class VerifyEvent {}
class LoadVerifyEvent extends VerifyEvent{
  final VerifyParams verifyParams;

  LoadVerifyEvent(this.verifyParams);
}
