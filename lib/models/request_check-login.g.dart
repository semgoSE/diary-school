// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_check-login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestCheckLoginAdapter extends TypeAdapter<RequestCheckLogin> {
  @override
  final int typeId = 3;

  @override
  RequestCheckLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestCheckLogin(
      login: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RequestCheckLogin obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.login);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestCheckLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
