// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) {
  return AuthData(
    token: json['token'] as String,
    cookie: json['cookie'] as String,
    id: json['id'] as int,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'token': instance.token,
      'cookie': instance.cookie,
    };
