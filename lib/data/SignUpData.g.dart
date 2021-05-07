// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignUpData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpData _$SignUpDataFromJson(Map<String, dynamic> json) {
  return SignUpData(
    json['login'] as String,
    json['password'] as String,
    json['cookies'] as String,
    (json['bind_accounts'] as List)
        ?.map((e) =>
            e == null ? null : AccountBind.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SignUpDataToJson(SignUpData instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'cookies': instance.cookies,
      'bind_accounts':
          instance.bind_accounts?.map((e) => e?.toJson())?.toList(),
    };
