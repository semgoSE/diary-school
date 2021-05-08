// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseAuthData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAuthData _$ResponseAuthDataFromJson(Map<String, dynamic> json) {
  return ResponseAuthData(
    json['token'] as String,
    json['userId'] as int,
  );
}

Map<String, dynamic> _$ResponseAuthDataToJson(ResponseAuthData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
    };
