import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class ResponseLogin {

  const ResponseLogin({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final List<AuthData> msg;

  factory ResponseLogin.fromJson(Map<String,dynamic> json) => ResponseLogin(
    success: json['success'] as bool,
    msg: (json['msg'] as List? ?? []).map((e) => AuthData.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.map((e) => e.toJson()).toList()
  };

  ResponseLogin clone() => ResponseLogin(
    success: success,
    msg: msg.map((e) => e.clone()).toList()
  );


  ResponseLogin copyWith({
    bool? success,
    List<AuthData>? msg
  }) => ResponseLogin(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLogin && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
