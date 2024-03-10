import 'package:poolino/features/add_feature/domain/entities/add_cost_entity.dart';

/// message : "کاربر پیدا شد"
/// result : {"id":38,"email":"09150575854","email_verified_at":null,"created_at":"2024-02-03T05:05:43.000000Z","updated_at":"2024-02-03T05:05:43.000000Z","name":null}

class AddCostModel extends AddCostEntity {
  const AddCostModel({
      String? message,
      Result? result,
  }):super(
    message: message,
    result: result
  );

  factory AddCostModel.fromJson(dynamic json) {
    return AddCostModel(
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