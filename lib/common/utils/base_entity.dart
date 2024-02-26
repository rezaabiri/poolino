import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {

  final String? message;
  final dynamic result;

  const BaseEntity(this.message, this.result);

  @override
  List<Object?> get props => [];

}