import 'package:diary_app/components/button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Icon(
            Icons.ac_unit_outlined,
            size: 128.0,
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: MyButton(
              click: () {
                Navigator.pushNamed(context, "/login");
              },
              child: "Вход",
              mode: "primary",
              disable: false,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: MyButton(
              child: "Регистрация",
              mode: "secondary",
              disable: false,
              click: () {
                Navigator.pushNamed(context, "/sign_up_1");
              },
            ),
          ),
        ],
      ),
    );
  }
}
