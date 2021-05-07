// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountBind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBind _$AccountBindFromJson(Map<String, dynamic> json) {
  return AccountBind(
    json['id'] as int,
    json['user_id'] as int,
    json['first_name'] as String,
    json['last_name'] as String,
    json['photo_200'] as String,
    json['token'] as String,
  );
}

Map<String, dynamic> _$AccountBindToJson(AccountBind instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'photo_200': instance.photo_200,
      'token': instance.token,
    };
