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
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Input(
              hint: "Пароль",
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
          )
        ],
      ),
    ));
  }
}
