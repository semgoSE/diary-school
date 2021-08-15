// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_check-login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseCheckLoginAdapter extends TypeAdapter<ResponseCheckLogin> {
  @override
  final int typeId = 6;

  @override
  ResponseCheckLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseCheckLogin(
      success: fields[0] as bool,
      msg: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseCheckLogin obj) {
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
      other is ResponseCheckLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
