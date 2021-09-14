import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'small_user.g.dart';
@immutable
@HiveType(typeId: 4)

class SmallUser {

  const SmallUser({
    this.firstName,
    this.lastName,
    required this.login,
    this.photo,
    required this.userId,
    required this.role,
  });

  @HiveField(0)
  final String? firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final String login;
  @HiveField(3)
  final String? photo;
  @HiveField(4)
  final int userId;
  @HiveField(5)
  final String role;

  factory SmallUser.fromJson(Map<String,dynamic> json) => SmallUser(
    firstName: json['first_name'] != null ? json['first_name'] as String : null,
    lastName: json['last_name'] != null ? json['last_name'] as String : null,
    login: json['login'] as String,
    photo: json['photo'] != null ? json['photo'] as String : null,
    userId: json['user_id'] as int,
    role: json['role'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'login': login,
    'photo': photo,
    'user_id': userId,
    'role': role
  };

  SmallUser clone() => SmallUser(
    firstName: firstName,
    lastName: lastName,
    login: login,
    photo: photo,
    userId: userId,
    role: role
  );


  SmallUser copyWith({
    Optional<String?>? firstName,
    Optional<String?>? lastName,
    String? login,
    Optional<String?>? photo,
    int? userId,
    String? role
  }) => SmallUser(
    firstName: checkOptional(firstName, this.firstName),
    lastName: checkOptional(lastName, this.lastName),
    login: login ?? this.login,
    photo: checkOptional(photo, this.photo),
    userId: userId ?? this.userId,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is SmallUser && firstName == other.firstName && lastName == other.lastName && login == other.login && photo == other.photo && userId == other.userId && role == other.role;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ login.hashCode ^ photo.hashCode ^ userId.hashCode ^ role.hashCode;
}
