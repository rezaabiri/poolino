import 'package:equatable/equatable.dart';

import '../../models/login_model.dart';

class LoginEntity extends Equatable{

  final String? message;
  final Result? result;


  const LoginEntity({this.message, this.result});

  @override
  List<Object?> get props => [];

}