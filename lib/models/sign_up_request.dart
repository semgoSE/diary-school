import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class SignUpRequest {

  const SignUpRequest({
    required this.login,
    required this.password,
    required this.session,
    required this.regionId,
    this.accountsBind,
  });

  @HiveField(0)
  final String login;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String session;
  @HiveField(3)
  final int regionId;
  @HiveField(4)
  final List<AccountBind>? accountsBind;

  factory SignUpRequest.fromJson(Map<String,dynamic> json) => SignUpRequest(
    login: json['login'] as String,
    password: json['password'] as String,
    session: json['session'] as String,
    regionId: json['region_id'] as int,
    accountsBind: json['accounts_bind'] != null ? (json['accounts_bind'] as List? ?? []).map((e) => AccountBind.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password,
    'session': session,
    'region_id': regionId,
    'accounts_bind': accountsBind?.map((e) => e.toJson()).toList()
  };

  SignUpRequest clone() => SignUpRequest(
    login: login,
    password: password,
    session: session,
    regionId: regionId,
    accountsBind: accountsBind?.map((e) => e.clone()).toList()
  );


  SignUpRequest copyWith({
    String? login,
    String? password,
    String? session,
    int? regionId,
    Optional<List<AccountBind>?>? accountsBind
  }) => SignUpRequest(
    login: login ?? this.login,
    password: password ?? this.password,
    session: session ?? this.session,
    regionId: regionId ?? this.regionId,
    accountsBind: checkOptional(accountsBind, this.accountsBind),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is SignUpRequest && login == other.login && password == other.password && session == other.session && regionId == other.regionId && accountsBind == other.accountsBind;

  @override
  int get hashCode => login.hashCode ^ password.hashCode ^ session.hashCode ^ regionId.hashCode ^ accountsBind.hashCode;
}
