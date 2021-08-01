import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'user.g.dart';

@immutable
@HiveType(typeId: 3)
class User {

  const User({
    required this.login,
    required this.userId,
    required this.classId,
    required this.role,
  });

  @HiveField(0)
  final String login;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final int classId;
  @HiveField(3)
  final String role;

  factory User.fromJson(Map<String,dynamic> json) => User(
    login: json['login'] as String,
    userId: json['user_id'] as int,
    classId: json['class_id'] as int,
    role: json['role'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'login': login,
    'user_id': userId,
    'class_id': classId,
    'role': role
  };

  User clone() => User(
    login: login,
    userId: userId,
    classId: classId,
    role: role
  );


  User copyWith({
    String? login,
    int? userId,
    int? classId,
    String? role
  }) => User(
    login: login ?? this.login,
    userId: userId ?? this.userId,
    classId: classId ?? this.classId,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is User && login == other.login && userId == other.userId && classId == other.classId && role == other.role;

  @override
  int get hashCode => login.hashCode ^ userId.hashCode ^ classId.hashCode ^ role.hashCode;
}
