// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_lesson_get.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseLessonGetAdapter extends TypeAdapter<ResponseLessonGet> {
  @override
  final int typeId = 10;

  @override
  ResponseLessonGet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseLessonGet(
      success: fields[0] as bool,
      msg: fields[1] as Lesson,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseLessonGet obj) {
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
      other is ResponseLessonGetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
