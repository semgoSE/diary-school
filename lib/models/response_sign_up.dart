import 'package:flutter/foundation.dart';


@immutable
class ResponseSignUp {

  const ResponseSignUp({
    required this.success,
    required this.msg,
  });

  final bool success;
  final Msg msg;

  factory ResponseSignUp.fromJson(Map<String,dynamic> json) => ResponseSignUp(
    success: json['success'] as bool,
    msg: Msg.fromJson(json['msg'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.toJson()
  };

  ResponseSignUp clone() => ResponseSignUp(
    success: success,
    msg: msg.clone()
  );


  ResponseSignUp copyWith({
    bool? success,
    Msg? msg
  }) => ResponseSignUp(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSignUp && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}

@immutable
class Msg {

  const Msg({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory Msg.fromJson(Map<String,dynamic> json) => Msg(
    token: json['token'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'token': token,
    'user': user.toJson()
  };

  Msg clone() => Msg(
    token: token,
    user: user.clone()
  );


  Msg copyWith({
    String? token,
    User? user
  }) => Msg(
    token: token ?? this.token,
    user: user ?? this.user,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Msg && token == other.token && user == other.user;

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}

@immutable
class User {

  const User({
    required this.login,
    required this.userId,
    required this.classId,
    required this.role,
  });

  final String login;
  final int userId;
  final int classId;
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
