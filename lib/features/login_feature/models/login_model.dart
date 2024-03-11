import 'package:poolino/features/login_feature/domain/entities/login_entity.dart';

/// message : "کاربر پیدا شد"
/// result : {"id":55,"phone":"09150575854","user_id":792020,"created_at":"2024-03-10T09:41:25.000000Z","updated_at":"2024-03-10T09:41:25.000000Z"}

class LoginModel extends LoginEntity {
  LoginModel({
      String? message, 
      Result? result,
  }):super(
    message: message,
    result: result
  );

  factory LoginModel.fromJson(dynamic json) {
    return LoginModel(
      message: json['message'],
      result: json['result'] != null ? Result.fromJson(json['result']) : null
    );
  }
  String? _message;
  Result? _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

/// id : 55
/// phone : "09150575854"
/// user_id : 792020
/// created_at : "2024-03-10T09:41:25.000000Z"
/// updated_at : "2024-03-10T09:41:25.000000Z"

class Result {
  Result({
      this.id,
      this.phone,
      this.userId,
      this.createdAt,
      this.updatedAt,});

  Result.fromJson(dynamic json) {
    id = json['id'];
    phone = json['phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? phone;
  num? userId;
  String? createdAt;
  String? updatedAt;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['phone'] = phone;
    map['user_id'] = userId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}