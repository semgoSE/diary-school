import 'package:dairy_app/data/AccountBind.dart';

class Dairy {
  static String cookies;
  static List<AccountBind> accounts_bind = [];
  static void addUser(int user_id, String first_name, String last_name,
      String photo_200, String token) {
    accounts_bind.add(AccountBind(
        accounts_bind.isEmpty ? 0 : accounts_bind.last.id + 1,
        user_id,
        first_name,
        last_name,
        photo_200,
        token));
  }

  static void removeUser(id) {
    accounts_bind.removeAt(accounts_bind.indexWhere((e) => e.id == id));
  }
}
