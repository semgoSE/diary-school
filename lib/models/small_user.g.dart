// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmallUserAdapter extends TypeAdapter<SmallUser> {
  @override
  final int typeId = 4;

  @override
  SmallUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmallUser(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      login: fields[2] as String,
      photo: fields[3] as String,
      userId: fields[4] as int,
      role: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SmallUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.login)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmallUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
