import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/placeholder.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  void login() async {
    showBarModalBottomSheet(context: context, builder: (context) {
      return WillPopScope(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(children: [
            AppBar(title: Text("Авторизация"), centerTitle: true, textTheme: Theme.of(context).textTheme, automaticallyImplyLeading: false),
            Container(child: Spinner()),
            Container(child: MyPlaceholder(child: "Это может занять некоторое время"), height: 44)
          ], mainAxisSize: MainAxisSize.min),
        ),
        onWillPop: () => Future.value(false),
      );
    }, topControl: Container(), enableDrag: false);
  }


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
                textInputAction: TextInputAction.next,
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
                child: MyButton(child: "Войти", mode: "commerce", click: login),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
            Container(child: MyPlaceholder(child: "или"), height: 90),
            Container(
                child: MyButton(
                  disable: true,
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
