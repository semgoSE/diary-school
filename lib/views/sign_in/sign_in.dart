import 'dart:async';
import 'dart:developer';

import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Input.dart';
import 'package:dairy_app/data/ResponseAuthData.dart';
import 'package:dairy_app/data/SignInData.dart';
import 'package:dairy_app/helpers/AuthModal.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State {
  final _passwordController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordFocus = FocusNode();

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

  void auth() async {
    showBarModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        topControl: Container(),
        builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) =>
                (WillPopScope(
                    child: AuthModal(child: Spinner(), header: "Авторизуем"),
                    onWillPop: () => Future.value(false)))));

    SignInData data = SignInData(
        login: _login, password: _password, type: SignInDataType.DEFAULT);
    var op = await API.sign_in(data);
    Navigator.pop(context);
    if (op['success']) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('user_id', op['data']['user_id']);
      log(op['data'].toString());
      await prefs.setString('token', op['data']['token']);
      var timer = new Timer(const Duration(seconds: 1), () {
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
      });
      FocusScope.of(context).unfocus();
      showBarModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          topControl: Container(),
          builder: (context) => (WillPopScope(
              child: AuthModal(
                  header: "Готово",
                  child: Icon(
                    Ionicons.ios_checkmark_circle_outline,
                    color: HexColor("#3f8ae0"),
                    size: 60,
                  )),
              onWillPop: () => Future.value(false))));
    } else {
      final snackBar = SnackBar(
          content: Text(op['data']),
          backgroundColor: HexColor("#e64646"),
          behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: HexColor("#ffffff"),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
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
                  child: SvgPicture.asset('res/study.svg',
                      width: 120, height: 120),
                ),
                Input(
                    hints: "Логин",
                    controller: _loginController,
                    is_hide: false,
                    textInputAction: TextInputAction.next),
                Input(
                    hints: "Пароль",
                    is_hide: true,
                    focusNode: _passwordFocus,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (e) {
                      if (_login != "" && _password != "") {
                        auth();
                      }
                    },
                    controller: _passwordController),
                Spacer(flex: 1),
                ButtonCommerce(
                  disable: (_login == "" || _password == ""),
                  text: "Войти",
                  click: () {
                    auth();
                  },
                ),
                ButtonPrimary(
                  text: "Регистрация",
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
