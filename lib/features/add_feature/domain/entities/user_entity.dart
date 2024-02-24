import 'package:equatable/equatable.dart';
import 'package:poolino/features/card_feature/models/user_model.dart';


class UserEntity extends Equatable{

  final String? message;
  final Result? result;


  const UserEntity({this.message, this.result});

  @override
  List<Object?> get props => [];

}