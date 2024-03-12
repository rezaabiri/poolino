import 'package:hive/hive.dart';
part 'sms_db_model.g.dart';

@HiveType(typeId: 0)
class SmsDbModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String smsBody;

  @HiveField(2)
  String sender;

  @HiveField(3)
  String timestamp;

  @HiveField(4)
  int status;

  SmsDbModel(
      {required this.id,
      required this.smsBody,
      required this.sender,
      required this.timestamp,
      required this.status});
}
