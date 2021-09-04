import 'package:diary_app/views/authentication/sign_up/server_url_argement.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'sign_up.g.dart';

// This is the class used by rest of your codebase
class SignUp = _SignUp with _$SignUp;

// The store-class
abstract class _SignUp with Store {
  @observable
  String login = "";

  @observable
  String password = "";

  @observable
  int region_id = 0;

  @observable
  String session = "";

  @action
  void setSignUp1(String _login, String _pass, int _region_id) {
    login = _login;
    password = _pass;
    region_id = _region_id;
  }

  @action
  void setLogin(String _login) {
    login = _login;
  }

  @action
  void setPassword(String _pass) {
    password = _pass;
  }

  @action
  void setUrl(int _region_id) {
    region_id = _region_id;
  }

  @action
  void setSession(String _session) {
    session = _session;
  }
}
