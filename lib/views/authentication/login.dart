import 'package:diary_app/api/common/CommonApi.dart';
import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/placeholder.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _login = "";
  String _pass = "";

  void initState() {
    _loginController.addListener(() {
      setState(() {
        _login = _loginController.value.text;
      });
    });

    _passController.addListener(() {
      setState(() {
        _pass = _passController.value.text;
      });
    });
  }

  void login() async {
    showBarModalBottomSheet(
      context: context,
      builder: (context) {
        return WillPopScope(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(children: [
              AppBar(
                  title: Text("Авторизация"),
                  centerTitle: true,
                  textTheme: Theme.of(context).textTheme,
                  automaticallyImplyLeading: false),
              Container(child: Spinner()),
              Container(
                  child:
                      MyPlaceholder(child: "Это может занять некоторое время"),
                  height: 44),
            ], mainAxisSize: MainAxisSize.min),
          ),
          onWillPop: () => Future.value(false),
        );
      },
      topControl: Container(),
      enableDrag: false,
    );
    Box<AuthData> box = Hive.box<AuthData>("auth_data");
    CommonApi api = CommonApi();
    api.setPath("user/login");
    api.setBody(RequestLogin(type: "DEFAULT", login: _login, password: _pass).toJson());
    var f = await api.request();
    if (f["success"]) {
      ResponseLogin response = ResponseLogin.fromJson(f);
      if(response.msg.length == 1) {
        box.put("auth", response.msg[0]);
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      }
    } else { //TODO
      print("ошибка");
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Вход"),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 0),
          child: ListView(children: [
            FormItem(
              child: Input(
                hint: "Введите логин",
                controller: _loginController,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_]')),
                ],
              ),
              top: "Логин",
            ),
            FormItem(
              child: Input(
                isPass: true,
                hint: "Введите пароль",
                controller: _passController,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_@#]')),
                ],
              ),
              top: "Пароль",
            ),
            Container(
                child: MyButton(
                  child: "Войти",
                  mode: "commerce",
                  click: login,
                  disable: _login.length < 6,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
            Container(child: MyPlaceholder(child: "или"), height: 90),
            Container(
                child: MyButton(
                  disable: true,
                  child: "Войти с Google",
                  mode: "outlined",
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            Container(
                child: MyButton(
                  child: "Войти c VK",
                  mode: "outlined",
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8))
          ], physics: PageScrollPhysics())),
    );
  }
}
