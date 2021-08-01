import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'request_check-login.g.dart';

@immutable
@HiveType(typeId: 3)
class RequestCheckLogin {

  const RequestCheckLogin({
    required this.login,
  });

  @HiveField(0)
  final String login;

  factory RequestCheckLogin.fromJson(Map<String,dynamic> json) => RequestCheckLogin(
    login: json['login'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'login': login
  };

  RequestCheckLogin clone() => RequestCheckLogin(
    login: login
  );


  RequestCheckLogin copyWith({
    String? login
  }) => RequestCheckLogin(
    login: login ?? this.login,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestCheckLogin && login == other.login;

  @override
  int get hashCode => login.hashCode;
}
