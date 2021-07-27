import 'package:flutter/foundation.dart';
import 'user.dart';

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
