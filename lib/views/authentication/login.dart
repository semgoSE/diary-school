import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/placeholder.dart';
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Вход"),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 0),
          child: ListView(children: [
            Container(
              child: Input(
                hint: "Логин",
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            Container(
              child: Input(
                hint: "Пароль",
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            Container(
                child: MyButton(child: "Войти", mode: "commerce"),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
            Container(child: MyPlaceholder(child: "или"), height: 90),
            Container(
                child: MyButton(child: "Войти с Google"),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            Container(
                child: MyButton(child: "Войти c VK"),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8))
          ], physics: PageScrollPhysics())),
    );
  }
}
