import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'full_user.g.dart';
@immutable
@HiveType(typeId: 2)

class FullUser {

  const FullUser({
    this.firstName,
    this.lastName,
    required this.nickname,
    this.photo,
    required this.userId,
    required this.role,
    required this.classId,
    required this.login,
    required this.schoolId,
  });

  @HiveField(0)
  final String? firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final String nickname;
  @HiveField(3)
  final String? photo;
  @HiveField(4)
  final int userId;
  @HiveField(5)
  final String role;
  @HiveField(6)
  final int classId;
  @HiveField(7)
  final String login;
  @HiveField(8)
  final int schoolId;

  factory FullUser.fromJson(Map<String,dynamic> json) => FullUser(
    firstName: json['first_name'] != null ? json['first_name'] as String : null,
    lastName: json['last_name'] != null ? json['last_name'] as String : null,
    nickname: json['nickname'] as String,
    photo: json['photo'] != null ? json['photo'] as String : null,
    userId: json['user_id'] as int,
    role: json['role'] as String,
    classId: json['class_id'] as int,
    login: json['login'] as String,
    schoolId: json['school_id'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'nickname': nickname,
    'photo': photo,
    'user_id': userId,
    'role': role,
    'class_id': classId,
    'login': login,
    'school_id': schoolId
  };

  FullUser clone() => FullUser(
    firstName: firstName,
    lastName: lastName,
    nickname: nickname,
    photo: photo,
    userId: userId,
    role: role,
    classId: classId,
    login: login,
    schoolId: schoolId
  );


  FullUser copyWith({
    Optional<String?>? firstName,
    Optional<String?>? lastName,
    String? nickname,
    Optional<String?>? photo,
    int? userId,
    String? role,
    int? classId,
    String? login,
    int? schoolId
  }) => FullUser(
    firstName: checkOptional(firstName, this.firstName),
    lastName: checkOptional(lastName, this.lastName),
    nickname: nickname ?? this.nickname,
    photo: checkOptional(photo, this.photo),
    userId: userId ?? this.userId,
    role: role ?? this.role,
    classId: classId ?? this.classId,
    login: login ?? this.login,
    schoolId: schoolId ?? this.schoolId,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is FullUser && firstName == other.firstName && lastName == other.lastName && nickname == other.nickname && photo == other.photo && userId == other.userId && role == other.role && classId == other.classId && login == other.login && schoolId == other.schoolId;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ nickname.hashCode ^ photo.hashCode ^ userId.hashCode ^ role.hashCode ^ classId.hashCode ^ login.hashCode ^ schoolId.hashCode;
}
