import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp1State();
}

class SignUp1State extends State<SignUp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text("Регистрация"), textTheme: Theme.of(context).textTheme),
      body: Column(),
    );
  }
}
