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
            child: Column(
                children: [
                  // Image.asset("resource/images/icon.png"),
                  Container(
                    child: Text("Добро пожаловать!",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24)),
                    margin: EdgeInsets.only(top: 32),
                  )
                ],
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CustomButton(
              click: () {
                Navigator.pushNamed(context, "/login");
              },
              child: "Вход",
              mode: ModeCustomButton.primary,
              disable: false,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CustomButton(
              child: "Регистрация",
              mode: ModeCustomButton.secondary,
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
