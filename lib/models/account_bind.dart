import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class AccountBind {

  const AccountBind({
    required this.type,
    required this.uuid,
    required this.token,
  });

  AccountBindTypeEnum get accountBindTypeEnum => _accountBindTypeEnumValues.map[type]!;
  @HiveField(0)
  final String type;
  @HiveField(1)
  final int uuid;
  @HiveField(2)
  final String token;

  factory AccountBind.fromJson(Map<String,dynamic> json) => AccountBind(
    type: json['type'] as String,
    uuid: json['uuid'] as int,
    token: json['token'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'type': type,
    'uuid': uuid,
    'token': token
  };

  AccountBind clone() => AccountBind(
    type: type,
    uuid: uuid,
    token: token
  );


  AccountBind copyWith({
    String? type,
    int? uuid,
    String? token
  }) => AccountBind(
    type: type ?? this.type,
    uuid: uuid ?? this.uuid,
    token: token ?? this.token,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AccountBind && type == other.type && uuid == other.uuid && token == other.token;

  @override
  int get hashCode => type.hashCode ^ uuid.hashCode ^ token.hashCode;
}

enum AccountBindTypeEnum { VK, DEFAULT }

extension AccountBindTypeEnumEx on AccountBindTypeEnum{
  String? get value => _accountBindTypeEnumValues.reverse[this];
}

final _accountBindTypeEnumValues = _AccountBindTypeEnumConverter({
  'VK': AccountBindTypeEnum.VK,
  'DEFAULT)': AccountBindTypeEnum.DEFAULT,
});


class _AccountBindTypeEnumConverter<String, O> {
  final Map<String, O> map;
  Map<O, String>? reverseMap;

  _AccountBindTypeEnumConverter(this.map);

  Map<O, String> get reverse => reverseMap ??= map.map((k, v) => MapEntry(v, k));
}

