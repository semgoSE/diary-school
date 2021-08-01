import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'auth_data.g.dart';

@immutable
@HiveType(typeId: 2)
class AuthData {

  const AuthData({
    required this.token,
    required this.user,
  });

  @HiveField(0)
  final String token;
  @HiveField(1)
  final User user;

  factory AuthData.fromJson(Map<String,dynamic> json) => AuthData(
    token: json['token'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'token': token,
    'user': user.toJson()
  };

  AuthData clone() => AuthData(
    token: token,
    user: user.clone()
  );


  AuthData copyWith({
    String? token,
    User? user
  }) => AuthData(
    token: token ?? this.token,
    user: user ?? this.user,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AuthData && token == other.token && user == other.user;

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
