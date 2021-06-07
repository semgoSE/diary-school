// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestAuth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAuth _$RequestAuthFromJson(Map<String, dynamic> json) {
  return RequestAuth(
    _$enumDecode(_$TypeEnumMap, json['type']),
    json['login'] as String,
    json['pasword'] as String,
    json['vk_id'] as int,
    json['vk_token'] as String,
  );
}

Map<String, dynamic> _$RequestAuthToJson(RequestAuth instance) =>
    <String, dynamic>{
      'type': _$TypeEnumMap[instance.type],
      'login': instance.login,
      'pasword': instance.pasword,
      'vk_id': instance.vk_id,
      'vk_token': instance.vk_token,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TypeEnumMap = {
  Type.DEFAULT: 'DEFAULT',
  Type.VK: 'VK',
};
