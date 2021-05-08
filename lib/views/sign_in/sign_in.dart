import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Input.dart';
import 'package:dairy_app/data/ResponseAuthData.dart';
import 'package:dairy_app/data/SignInData.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State {
  final _passwordController = TextEditingController();
  final _loginController = TextEditingController();

  String _login = "";
  String _password = "";

  @override
  void initState() {
    _loginController.addListener(() {
      setState(() {
        _login = _loginController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void auth() async {
    SignInData data = SignInData(
        login: _login, password: _password, type: SignInDataType.DEFAULT);
    bool op = await API.sign_in(data);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: HexColor("#ffffff"),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: HexColor("#ffffff"),
              title: Text(
                'Регистрация',
                style: TextStyle(color: HexColor("#000000")),
              ),
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset('res/study.svg',
                      width: 120, height: 120),
                ),
                Input(
                    hints: "Логин",
                    controller: _loginController,
                    is_hide: false,
                    textInputAction: TextInputAction.next),
                Input(
                    hints: "Пароль",
                    is_hide: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (e) {
                      if (_login != "" && _password != "") {
                        auth();
                      }
                    },
                    controller: _passwordController),
                Spacer(flex: 1),
                ButtonCommerce(
                  disable: (_login == "" || _password == ""),
                  text: "Войти",
                  click: () {
                    auth();
                  },
                ),
                ButtonPrimary(
                  text: "Регистрация",
                  click: () {
                    print("ff");
                    Navigator.pushNamed(context, "/sign_up_1");
                  },
                ),
              ],
              // mainAxisAlignment: MainAxisAlignment.center,
            )),
        onWillPop: () => Future.value(false));
  }
}
