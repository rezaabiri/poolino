import 'package:poolino/features/card_feature/domain/entities/user_entity.dart';

/// message : "کاربر پیدا شد"
/// result : {"id":38,"email":"09150575854","email_verified_at":null,"created_at":"2024-02-03T05:05:43.000000Z","updated_at":"2024-02-03T05:05:43.000000Z","name":null}

class UserModel extends UserEntity {
  const UserModel({
      String? message,
      Result? result,
  }):super(
    message: message,
    result: result
  );

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      message: json['message'],
      result: json['result'] != null ? Result.fromJson(json['result']) : null
    );
  }
}

/// id : 38
/// email : "09150575854"
/// email_verified_at : null
/// created_at : "2024-02-03T05:05:43.000000Z"
/// updated_at : "2024-02-03T05:05:43.000000Z"
/// name : null

class Result {
  Result({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.name
  });

  Result.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
  }
  num? id;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  dynamic name;

}