// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get-info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetInfoAdapter extends TypeAdapter<GetInfo> {
  @override
  final int typeId = 3;

  @override
  GetInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetInfo(
      lesson: fields[0] as Lesson,
    );
  }

  @override
  void write(BinaryWriter writer, GetInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lesson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
