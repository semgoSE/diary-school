// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_bind.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountBindAdapter extends TypeAdapter<AccountBind> {
  @override
  final int typeId = 1;

  @override
  AccountBind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountBind(
      type: fields[0] as String,
      uuid: fields[1] as int,
      token: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountBind obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountBindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
