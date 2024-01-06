
import '../domain/entities/login_entity.dart';

/// message : "token generated successfully"
/// result : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Bvb2xpbm9hcHAub2ZmZXJqYS5pci9wb29saW5vX2Z0cC9wdWJsaWMvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MDQ1NTc2NjksImV4cCI6MTcwNDU2MTI2OSwibmJmIjoxNzA0NTU3NjY5LCJqdGkiOiJkOFpaTEF0cHAxNUhoV3lrIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.8eURNXNp9NjWnhVbjpvT5iY5Hs_TFYdE9UP0dmdPOGo","token_type":"bearer","expires_in":3600}

class LoginModel extends LoginEntity {
  const LoginModel({
    String? message,
    Result? result,
  }) : super(
    message: message,
    result: result,
  );

  factory LoginModel.fromJson(dynamic json) {

    return LoginModel(
      message: json['message'],
      result: json['result'] != null ? Result.fromJson(json['result']) : null
    );
  }
}

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Bvb2xpbm9hcHAub2ZmZXJqYS5pci9wb29saW5vX2Z0cC9wdWJsaWMvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MDQ1NTc2NjksImV4cCI6MTcwNDU2MTI2OSwibmJmIjoxNzA0NTU3NjY5LCJqdGkiOiJkOFpaTEF0cHAxNUhoV3lrIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.8eURNXNp9NjWnhVbjpvT5iY5Hs_TFYdE9UP0dmdPOGo"
/// token_type : "bearer"
/// expires_in : 3600

class Result {
  Result({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn,});

  Result.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
  String? accessToken;
  String? tokenType;
  num? expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    return map;
  }

}