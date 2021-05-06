class Dairy {
  static String cookies;
  static List<User> users = [];
  static void addUser(int user_id, String first_name, String last_name,
      String photo_200, String token) {
    users.add(User(users.isEmpty ? 0 : users.last.id + 1, user_id, first_name,
        last_name, photo_200, token));
  }

  static void removeUser(id) {
    users.removeAt(users.indexWhere((e) => e.id == id));
  }
}

class User {
  final int id;
  final int user_id;
  final String first_name;
  final String last_name;
  final String photo_200;
  final String token;

  User(this.id, this.user_id, this.first_name, this.last_name, this.photo_200,
      this.token);
}
