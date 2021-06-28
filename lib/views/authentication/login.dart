import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
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
            FormItem(
              child: Input(
                hint: "Введите логин",
              ),
              top: "Логин",
            ),
            FormItem(
              child: Input(
                isPass: true,
                hint: "Введите пароль",
              ),
              top: "Пароль",
            ),
            Container(
                child: MyButton(child: "Войти", mode: "commerce"),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
            Container(child: MyPlaceholder(child: "или"), height: 90),
            Container(
                child: MyButton(
                  child: "Войти с Google",
                  mode: "outlined",
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            Container(
                child: MyButton(
                  child: "Войти c VK",
                  mode: "outlined",
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8))
          ], physics: PageScrollPhysics())),
    );
  }
}
