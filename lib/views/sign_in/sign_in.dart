import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State {
  String login;
  String password;

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: HexColor("#ffffff"),
              title: Text(
                'Регистрация',
                style: TextStyle(color: HexColor("#000000")),
              ),
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset('assets/study.svg',
                      width: 120, height: 120),
                ),
                Input(hints: "Логин"),
                Input(hints: "Пароль"),
                Spacer(flex: 1),
                ButtonCommerce(
                  text: "Войти",
                  click: () {},
                ),
                ButtonPrimary(
                  text: "Регситрация",
                  click: () {
                    print("ff");
                    Navigator.pushNamed(context, "/sign_up_1");
                  },
                ),
              ],
              // mainAxisAlignment: MainAxisAlignment.center,
            )),
        onWillPop: () => Future.value(false));
  }
}
