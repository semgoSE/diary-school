// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FullUserAdapter extends TypeAdapter<FullUser> {
  @override
  final int typeId = 2;

  @override
  FullUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FullUser(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      nickname: fields[2] as String,
      photo: fields[3] as String,
      userId: fields[4] as int,
      role: fields[5] as String,
      classId: fields[6] as int,
      login: fields[7] as String,
      schoolId: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FullUser obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.nickname)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.classId)
      ..writeByte(7)
      ..write(obj.login)
      ..writeByte(8)
      ..write(obj.schoolId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FullUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
