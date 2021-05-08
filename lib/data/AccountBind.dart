import 'package:dairy_app/data/AuthData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AccountBind.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountBind {
  @JsonKey(ignore: true)
  final int id;

  final int uuid;

  @JsonKey(ignore: true)
  final String name;

  @JsonKey(ignore: true)
  final String img;

  final AuthData authData;

  AccountBind({this.id, this.uuid, this.name, this.img, this.authData});

  Map<String, dynamic> toJson() => _$AccountBindToJson(this);
}
