import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State {
  String login;
  String password;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Регистрация'),
              automaticallyImplyLeading: false,
            ),
            body: Align(
                alignment: Alignment.center,
                child: Container(child: TextField()))),
        onWillPop: () => Future.value(false));
  }
}
