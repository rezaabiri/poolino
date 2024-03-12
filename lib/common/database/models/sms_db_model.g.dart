// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmsDbModelAdapter extends TypeAdapter<SmsDbModel> {
  @override
  final int typeId = 0;

  @override
  SmsDbModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmsDbModel(
      id: fields[0] as String,
      smsBody: fields[1] as String,
      sender: fields[2] as String,
      timestamp: fields[3] as String,
      status: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SmsDbModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.smsBody)
      ..writeByte(2)
      ..write(obj.sender)
      ..writeByte(3)
      ..write(obj.timestamp)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmsDbModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
