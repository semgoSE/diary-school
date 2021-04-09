import 'package:hive/hive.dart';

part 'store.g.dart';

@HiveType(typeId: 1)
class Store extends HiveObject {
  @HiveField(0)
  int user_id;

  @HiveField(1)
  String access_token;

  Store(this.user_id, this.access_token);
}
