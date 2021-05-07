import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Input.dart';
import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:dairy_app/data/SignUpData.dart';
import 'package:dairy_app/helpers/AuthModal.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:dairy_app/views/sign_up/Dairy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignUp_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp_3State();
}

class SignUp_3State extends State {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _loginController = TextEditingController();

  String _login = "";
  String _password = "";

  @override
  void initState() {
    _loginController.addListener(() {
      setState(() {
        _login = _loginController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void reg() async {
    showBarModalBottomSheet(
        context: context,
        // isDismissible: false,
        topControl: Container(),
        builder: (context) => (AuthModal()));
    API.sign_up(
        SignUpData(_login, _password, Dairy.cookies, Dairy.accounts_bind));
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
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
          Expanded(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Input(
                          hints: "Введите логин",
                          controller: _loginController,
                          is_hide: false,
                          textInputAction: TextInputAction.next),
                      Input(
                          hints: "Введите пароль",
                          is_hide: true,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (e) {
                            if (_login != "" && _password != "") {
                              reg();
                            }
                          },
                          controller: _passwordController)
                    ],
                  ))),
          ButtonCommerce(
            text: "Готово",
            disable: (_login == "" || _password == ""),
            click: () {
              reg();
            },
          )
        ],
      ),
    ));
  }
}
