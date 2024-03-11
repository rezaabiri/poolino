import 'package:poolino/features/add_feature/domain/entities/add_income_entity.dart';

/// message : "ثبت درآمد با موفقیت انجام شد"
/// result : null

class AddIncomeModel extends AddIncomeEntity {
  AddIncomeModel({
    String? message,
    dynamic result,
  }) :super(
      message: message,
      result: result
  );

  factory AddIncomeModel.fromJson(dynamic json) {
    return AddIncomeModel(
        message: json['message'],
        result: json['result']
    );
  }
}
class Result {
  Result({
    this.message,
    this.result,
  });

  String? message;
  dynamic result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result'] = result;
    return map;
  }

}