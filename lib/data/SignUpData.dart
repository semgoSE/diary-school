import 'package:dairy_app/data/AccountBind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SignUpData.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpData {
  final String login;
  final String password;
  final String cookies;
  final List<AccountBind> bind_accounts;

  SignUpData(this.login, this.password, this.cookies, this.bind_accounts);

  Map<String, dynamic> toJson() => _$SignUpDataToJson(this);
}
