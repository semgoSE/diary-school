// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_lessons_get.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseLessonsGetAdapter extends TypeAdapter<ResponseLessonsGet> {
  @override
  final int typeId = 7;

  @override
  ResponseLessonsGet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseLessonsGet(
      success: fields[0] as bool,
      msg: (fields[1] as List).cast<Timetable>(),
    );
  }

  @override
  void write(BinaryWriter writer, ResponseLessonsGet obj) {
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
      other is ResponseLessonsGetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
