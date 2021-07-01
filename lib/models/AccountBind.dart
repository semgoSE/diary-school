class AccountBind {
  AccountBindType? type;
  var uuid;
  String? token;

  AccountBind({this.type = AccountBindType.VK, this.uuid, this.token});
}

enum AccountBindType {
  VK
}