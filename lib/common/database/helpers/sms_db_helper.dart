import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:poolino/common/database/models/sms_db_model.dart';


class SmsDbHelper {
  static final SmsDbHelper _instance = SmsDbHelper._internal();

  factory SmsDbHelper() => _instance;

  SmsDbHelper._internal();

  Future<void> init() async {
    Hive
      ..init(Directory.systemTemp.path)
      ..registerAdapter(SmsDbModelAdapter());

    //await Hive.openBox('smsBox');
  }

  Future<void> addSMS(List<SmsDbModel> smsDbModel) async {
    final box = await Hive.openBox<List<SmsDbModel>>('smsBox');
    await box.put('sms', smsDbModel);

  }

  Future<List<SmsDbModel>?> getSMS() async {
    final box = await Hive.openBox<List<SmsDbModel>>('smsBox');
    return box.get('sms', defaultValue: []);
  }

  List<SmsDbModel> getSMSNoSync() {
    final box = Hive.box<List<SmsDbModel>>('smsBox');
    return box.get('sms', defaultValue: [])!;
  }

  Future<void> clearDatabase() async {

    if (Hive.isBoxOpen("smsBox")) {
      await Hive.close();
    }
    await Hive.deleteBoxFromDisk("smsBox");
  }

}
