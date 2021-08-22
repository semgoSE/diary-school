import 'package:diary_app/api/user/UserApi.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'config_app.g.dart';

// This is the class used by rest of your codebase
class Config = _Config with _$Config;

// The store-class
abstract class _Config with Store {
  @observable
  ThemeConfig theme = ThemeConfig.light;

  @observable
  bool login = false;

  @observable 
  late PayloadToken payloadToken;

  @observable
  late String token;

  @action
  void setTheme(ThemeConfig theme) {
    this.theme = theme;
  }

  @action 
  void setLogin(bool _login) {
    login = _login;
  }
    
  @action
  void addAuthData(String token, PayloadToken payloadToken) {
    this.payloadToken = payloadToken;
    this.token = token;
  }
}

enum ThemeConfig {
  light,
  dark
}
