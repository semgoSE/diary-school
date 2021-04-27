import 'package:dairy_app/components/Button.dart';
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
                CommerceButton(
                  text: "Войти",
                  click: () {},
                ),
                PrimaryButton(
                  text: "Регситрация",
                  click: () {},
                ),
              ],
              // mainAxisAlignment: MainAxisAlignment.center,
            )),
        onWillPop: () => Future.value(false));
  }
}

class Input extends StatelessWidget {
  String hints = "";

  Input({this.hints, Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return (Container(
      child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: HexColor("#f2f3f5"),

              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green),
              //   borderRadius: BorderRadius.circular(25.7),
              // ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              hintText: hints)),
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ));
  }
}

class PanelHeader extends StatelessWidget {
  String header = "";
  bool is_back = true;

  PanelHeader({@required this.header, this.is_back, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return (AppBar(
      backgroundColor: HexColor("#ffffff"),
      title: Text(
        header,
        style: TextStyle(color: HexColor("#000000")),
      ),
      automaticallyImplyLeading: false,
    ));
  }
}
