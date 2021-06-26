import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/redux/actions/AddLoginAndPasswordSignUp.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SignUp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp1State();
}

class SignUp1State extends State<SignUp1> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _login = "";
  String _pass = "";

  void initState() {
    _loginController.addListener(() {
      setState(() {
        _login = _loginController.value.text;
      });
    });

    _passController.addListener(() {
      setState(() {
        _pass = _passController.value.text;
      });
    });
  }

  void next(addLoginAndPasswordSignUp) {
    Navigator.pushNamed(context, "/sign_up_2");
    addLoginAndPasswordSignUp(_login, _pass);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateStore, void Function(String login, String pass)>(
      converter: (store) => (login, pass) => store
          .dispatch(AddLoginAndPasswordSignUp(password: pass, login: login)),
      builder: (BuildContext context, addLoginAndPasswordSignUp) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
              title: Text("Регистрация"),
              textTheme: Theme.of(context).textTheme),
          body: Column(children: [
            Expanded(
                child: Column(children: [
              Container(
                  child: Input(hint: "Логин", controller: _loginController),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
              Container(
                  child: Input(hint: "Пароль", controller: _passController),
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 32))
            ], mainAxisAlignment: MainAxisAlignment.center)),
            Container(
                child: MyButton(
                    child: "Далее",
                    disable: (_login == "" || _pass == ""),
                    click: () {
                      next(addLoginAndPasswordSignUp);
                    }),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16))
          ]),
        );
      },
    );
  }
}
