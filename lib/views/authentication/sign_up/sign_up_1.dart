import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp1State();
}

class SignUp1State extends State<SignUp1> {
  TextEditingController _login = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text("Регистрация"), textTheme: Theme.of(context).textTheme),
      body: Column(children: [
        Expanded(
            child: Column(children: [
          Container(
              child: Input(hint: "Логин", controller: _login),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          Container(
              child: Input(hint: "Пароль", controller: _pass),
              padding: EdgeInsets.fromLTRB(16, 8, 16, 32))
        ], mainAxisAlignment: MainAxisAlignment.center)),
        Container(
            child: MyButton(
                child: "Далее",
                disable: (_login.value.text == "" || _pass.value.text == "")),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16))
      ]),
    );
  }
}
