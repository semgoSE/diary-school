import 'package:flutter/foundation.dart';


@immutable
class ResponseCheckLogin {

  const ResponseCheckLogin({
    required this.success,
    required this.msg,
  });

  final bool success;
  final String msg;

  factory ResponseCheckLogin.fromJson(Map<String,dynamic> json) => ResponseCheckLogin(
    success: json['success'] as bool,
    msg: json['msg'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg
  };

  ResponseCheckLogin clone() => ResponseCheckLogin(
    success: success,
    msg: msg
  );


  ResponseCheckLogin copyWith({
    bool? success,
    String? msg
  }) => ResponseCheckLogin(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCheckLogin && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
