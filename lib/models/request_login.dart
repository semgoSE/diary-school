import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable

class RequestLogin {

  const RequestLogin({
    required this.type,
    required this.login,
    required this.password,
  });

  RequestLoginTypeEnum get requestLoginTypeEnum => _requestLoginTypeEnumValues.map[type]!;
  final String type;
  final String login;
  final String password;

  factory RequestLogin.fromJson(Map<String,dynamic> json) => RequestLogin(
    type: json['type'] as String,
    login: json['login'] as String,
    password: json['password'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'type': type,
    'login': login,
    'password': password
  };

  RequestLogin clone() => RequestLogin(
    type: type,
    login: login,
    password: password
  );


  RequestLogin copyWith({
    String? type,
    String? login,
    String? password
  }) => RequestLogin(
    type: type ?? this.type,
    login: login ?? this.login,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestLogin && type == other.type && login == other.login && password == other.password;

  @override
  int get hashCode => type.hashCode ^ login.hashCode ^ password.hashCode;
}

enum RequestLoginTypeEnum { VK, DEFAULT }

extension RequestLoginTypeEnumEx on RequestLoginTypeEnum{
  String? get value => _requestLoginTypeEnumValues.reverse[this];
}

final _requestLoginTypeEnumValues = _RequestLoginTypeEnumConverter({
  'VK': RequestLoginTypeEnum.VK,
  'DEFAULT)': RequestLoginTypeEnum.DEFAULT,
});


class _RequestLoginTypeEnumConverter<String, O> {
  final Map<String, O> map;
  Map<O, String>? reverseMap;

  _RequestLoginTypeEnumConverter(this.map);

  Map<O, String> get reverse => reverseMap ??= map.map((k, v) => MapEntry(v, k));
}

