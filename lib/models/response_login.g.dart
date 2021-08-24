// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseLoginAdapter extends TypeAdapter<ResponseLogin> {
  @override
  final int typeId = 8;

  @override
  ResponseLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseLogin(
      success: fields[0] as bool,
      msg: (fields[1] as List).cast<AuthData>(),
    );
  }

  @override
  void write(BinaryWriter writer, ResponseLogin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.msg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}