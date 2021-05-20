import 'package:dairy_app/data/AccountBind.dart';
import 'package:dairy_app/data/AuthData.dart';

class Dairy {
  static String cookies;
  static List<AccountBind> accounts_bind = [];
  static void addUser(int uuid, String name, String img, AuthData authData) {
    accounts_bind.add(AccountBind(
        id: accounts_bind.isEmpty ? 0 : accounts_bind.last.id + 1,
        uuid: uuid,
        name: name,
        img: img,
        authData: authData));
  }

  static List<dynamic> getAccountsBind() {
    return accounts_bind
        .map((e) => {
              'type': e.authData.type,
              'data': {
                (e.authData.type == "VK" ? 'vk_id' : 'id'): e.authData.id,
                'token': e.authData.token
              }
            })
        .toList();
  }

  static void removeUser(id) {
    accounts_bind.removeAt(accounts_bind.indexWhere((e) => e.id == id));
  }
}
