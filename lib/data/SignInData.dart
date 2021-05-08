import 'package:dairy_app/data/AuthData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SignInData.g.dart';

@JsonSerializable()
class SignInData {
  final String login;
  final String password;
  final String type;
  final AuthData authData;

  SignInData(
      {this.login = "",
      this.password = "",
      this.type = SignInDataType.DEFAULT,
      this.authData});

  Map<String, dynamic> toJson() => _$SignInDataToJson(this);
}

class SignInDataType {
  static const String DEFAULT = "DEFAULT";
  static const String VK = "VK";
}
