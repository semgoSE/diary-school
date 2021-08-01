// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignUpRequestAdapter extends TypeAdapter<SignUpRequest> {
  @override
  final int typeId = 8;

  @override
  SignUpRequest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignUpRequest(
      login: fields[0] as String,
      password: fields[1] as String,
      session: fields[2] as String,
      accountsBind: (fields[3] as List?)?.cast<AccountBind>(),
    );
  }

  @override
  void write(BinaryWriter writer, SignUpRequest obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.session)
      ..writeByte(3)
      ..write(obj.accountsBind);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpRequestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
