import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Input.dart';
import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp_3State();
}

class SignUp_3State extends State {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: HexColor("#ffffff"),
      appBar: AppBar(
        backgroundColor: HexColor("#ffffff"),
        elevation: 0,
        iconTheme: IconThemeData(color: HexColor("#000000")),
        title:
            Text("Регистрация", style: TextStyle(color: HexColor("#000000"))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: TitleLevel_1("#3 - Завершение"),
          ),
          Container(
              child: Placeholder2(
                description:
                    "Введите пароль, который Вы точно не забудите. Он может вам потребоваться позже",
              ),
              padding: EdgeInsets.symmetric(vertical: 16)),
          Expanded(child: Input(hints: "Введите пароль")),
          ButtonCommerce(
            text: "Готово",
            click: () {},
          )
        ],
      ),
    ));
  }
}
