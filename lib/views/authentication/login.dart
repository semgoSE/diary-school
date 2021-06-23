import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Вход"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(children: [
                Container(
                  child: Input(
                    hint: "Логин",
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                Container(
                  child: Input(
                    hint: "Пароль",
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ])),
              Container(
                  child: MyButton(child: Text("Войти"), mode: "commerce"),
                  padding: EdgeInsets.only(bottom: 16))
            ],
          ),
        ));
  }
}
