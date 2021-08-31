// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final int typeId = 4;

  @override
  Lesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      lessonId: fields[0] as int,
      classId: fields[1] as int,
      weekOfDay: fields[2] as int,
      index: fields[3] as int,
      office: fields[4] as String,
      timeBegin: fields[5] as String,
      timeEnd: fields[6] as String,
      subjectId: fields[7] as int,
      teacherId: fields[8] as int?,
      subject: fields[9] as Subject,
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.lessonId)
      ..writeByte(1)
      ..write(obj.classId)
      ..writeByte(2)
      ..write(obj.weekOfDay)
      ..writeByte(3)
      ..write(obj.index)
      ..writeByte(4)
      ..write(obj.office)
      ..writeByte(5)
      ..write(obj.timeBegin)
      ..writeByte(6)
      ..write(obj.timeEnd)
      ..writeByte(7)
      ..write(obj.subjectId)
      ..writeByte(8)
      ..write(obj.teacherId)
      ..writeByte(9)
      ..write(obj.subject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
