import 'package:equatable/equatable.dart';
import 'package:poolino/features/login_feature/models/verify_model.dart';

class VerifyEntity extends Equatable{

  final String? message;
  final Result? result;


  const VerifyEntity({this.message, this.result});

  @override
  List<Object?> get props => [];

}