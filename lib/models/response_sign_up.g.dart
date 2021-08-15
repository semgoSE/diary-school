// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_sign_up.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseSignUpAdapter extends TypeAdapter<ResponseSignUp> {
  @override
  final int typeId = 9;

  @override
  ResponseSignUp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseSignUp(
      success: fields[0] as bool,
      msg: fields[1] as AuthData,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseSignUp obj) {
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
      other is ResponseSignUpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
