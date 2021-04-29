import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/views/sign_up/WebViewArgs.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp_1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#ffffff"),
        title: Text(
          "Регистрация",
          style: TextStyle(color: HexColor("#000000")),
        ),
      ),
      body: Column(children: [
        OutlnButton(
          text: "Войти через эл. дневник",
          click: () => {
            Navigator.pushNamed(context, "/webview",
                arguments: WebViewArgs("vk.com"))
          },
        ),
        OutlnButton(
          text: "Войти через гос услуги.",
        )
      ], mainAxisAlignment: MainAxisAlignment.center),
    ));
  }
}
