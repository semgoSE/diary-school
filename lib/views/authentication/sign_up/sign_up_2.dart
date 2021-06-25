import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp2State();
}

class SignUp2State extends State<SignUp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text("Электронный дневник"),
          textTheme: Theme.of(context).textTheme),
      body: Column(children: []),
    );
  }
}
