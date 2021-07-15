import 'package:flutter/foundation.dart';
import 'account_bind.dart';

@immutable
class SignUp {

  const SignUp({
    required this.login,
    required this.password,
    required this.session,
    this.accountsBind,
  });

  final String login;
  final String password;
  final String session;
  final List<AccountBind>? accountsBind;

  factory SignUp.fromJson(Map<String,dynamic> json) => SignUp(
    login: json['login'] as String,
    password: json['password'] as String,
    session: json['session'] as String,
    accountsBind: json['accounts_bind'] != null ? (json['accounts_bind'] as List? ?? []).map((e) => AccountBind.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password,
    'session': session,
    'accounts_bind': accountsBind?.map((e) => e.toJson()).toList()
  };

  SignUp clone() => SignUp(
    login: login,
    password: password,
    session: session,
    accountsBind: accountsBind?.map((e) => e.clone()).toList()
  );


  SignUp copyWith({
    String? login,
    String? password,
    String? session,
    List<AccountBind>? accountsBind
  }) => SignUp(
    login: login ?? this.login,
    password: password ?? this.password,
    session: session ?? this.session,
    accountsBind: accountsBind ?? this.accountsBind,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is SignUp && login == other.login && password == other.password && session == other.session && accountsBind == other.accountsBind;

  @override
  int get hashCode => login.hashCode ^ password.hashCode ^ session.hashCode ^ accountsBind.hashCode;
}
