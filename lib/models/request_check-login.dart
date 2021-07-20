import 'package:flutter/foundation.dart';


@immutable
class RequestCheckLogin {

  const RequestCheckLogin({
    required this.login,
  });

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
