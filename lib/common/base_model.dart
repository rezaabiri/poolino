/// message : "کاربر پیدا شد"
/// result : null

class BaseModel {
  BaseModel({
      String? message, 
      dynamic result,}){
    _message = message;
    _result = result;
}

  BaseModel.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'];
  }
  String? _message;
  dynamic _result;

  String? get message => _message;
  dynamic get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['result'] = _result;
    return map;
  }

}