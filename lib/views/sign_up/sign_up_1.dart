import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:dairy_app/views/sign_up/WebViewArgs.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp_1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#ffffff"),
        elevation: 0,
        iconTheme: IconThemeData(color: HexColor("#000000")),
        title: Text(
          "Регистрация",
          style: TextStyle(color: HexColor("#000000")),
        ),
      ),
      body: Column(children: [
        Expanded(child: TitleLevel_1("#1 - Вход"), flex: 1),
        ButtonOutline(
          text: "Войти через эл. дневник",
          click: () => {
            Navigator.pushNamed(context, "/webview",
                arguments: WebViewArgs(
                    "https://e-school.ryazangov.ru/personal-area/#diary",
                    "Войти через эл. дневник",
                    "https://e-school.ryazangov.ru/personal-area/#diary"))
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          child: Text(
            "Или",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        ButtonOutline(
          text: "Войти через гос услуги",
          click: () => {
            Navigator.pushNamed(context, "/webview",
                arguments: WebViewArgs(
                    "https://e-school.ryazangov.ru/auth/esia/send-authn-request",
                    "Войти через гос услуги",
                    "https://e-school.ryazangov.ru/personal-area/"))
          },
        ),
        Spacer(flex: 1)
      ], mainAxisAlignment: MainAxisAlignment.center),
    ));
  }
}
