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
  });

  final Token token;

  factory Msg.fromJson(Map<String,dynamic> json) => Msg(
    token: Token.fromJson(json['token'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'token': token.toJson()
  };

  Msg clone() => Msg(
    token: token.clone()
  );


  Msg copyWith({
    Token? token
  }) => Msg(
    token: token ?? this.token,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Msg && token == other.token;

  @override
  int get hashCode => token.hashCode;
}

@immutable
class Token {

  const Token({
    required this.token,
    required this.version,
    required this.data,
  });

  final String token;
  final int version;
  final Data data;

  factory Token.fromJson(Map<String,dynamic> json) => Token(
    token: json['token'] as String,
    version: json['version'] as int,
    data: Data.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'token': token,
    'version': version,
    'data': data.toJson()
  };

  Token clone() => Token(
    token: token,
    version: version,
    data: data.clone()
  );


  Token copyWith({
    String? token,
    int? version,
    Data? data
  }) => Token(
    token: token ?? this.token,
    version: version ?? this.version,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Token && token == other.token && version == other.version && data == other.data;

  @override
  int get hashCode => token.hashCode ^ version.hashCode ^ data.hashCode;
}

@immutable
class Data {

  const Data({
    required this.userId,
    required this.role,
  });

  final int userId;
  final String role;

  factory Data.fromJson(Map<String,dynamic> json) => Data(
    userId: json['user_id'] as int,
    role: json['role'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'role': role
  };

  Data clone() => Data(
    userId: userId,
    role: role
  );


  Data copyWith({
    int? userId,
    String? role
  }) => Data(
    userId: userId ?? this.userId,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Data && userId == other.userId && role == other.role;

  @override
  int get hashCode => userId.hashCode ^ role.hashCode;
}
