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
  String url = "";

  @observable
  String session = "";

  @action
  void setSignUp1(String _login, String _pass, String _url) {
    login = _login;
    password = _pass;
    url = _url;
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
  void setUrl(String _url) {
    url = _url;
  }

  @action
  void setSession(String _session) {
    session = _session;
  }
}
