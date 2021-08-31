// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_get-info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseGetInfoAdapter extends TypeAdapter<ResponseGetInfo> {
  @override
  final int typeId = 8;

  @override
  ResponseGetInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseGetInfo(
      success: fields[0] as bool,
      msg: fields[1] as GetInfo,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseGetInfo obj) {
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
      other is ResponseGetInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
