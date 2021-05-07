import 'package:json_annotation/json_annotation.dart';

part 'AccountBind.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountBind {
  final int id;
  final int user_id;
  final String first_name;
  final String last_name;
  final String photo_200;
  final String token;

  AccountBind(this.id, this.user_id, this.first_name, this.last_name,
      this.photo_200, this.token);

  factory AccountBind.fromJson(Map<String, dynamic> json) =>
      _$AccountBindFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBindToJson(this);
}
