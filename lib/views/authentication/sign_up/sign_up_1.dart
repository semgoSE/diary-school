import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/select_mimicry.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/redux/actions/AddLoginAndPasswordAndRegionSignUp.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:diary_app/views/authentication/sign_up/server_url_argement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignUp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp1State();
}

class SignUp1State extends State<SignUp1> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  List<Map<String, dynamic>> regions = [
    {
      "region_id": 0,
      "name": "Рязанская область",
      "url": "https://e-school.ryazangov.ru"
    }
  ];

  String _login = "";
  String _pass = "";
  String _url_region = "";
  TextEditingController _controllerRegion = TextEditingController();
  int _region_id = -1;

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

  void openMenuChooseRegion() {
    print("ff");
    showBarModalBottomSheet(
      context: context,
      builder: (context) => Column(
        children: [
          AppBar(
              title: Text("Выберите регион"),
              automaticallyImplyLeading: false,
              textTheme: Theme.of(context).textTheme,
              centerTitle: true),
          ...regions
              .map((e) => SimpleCell(
                  child: e['name'],
                  onClick: () => chooseRegion(e)))
              .toList()
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  void chooseRegion(Map<String, dynamic> region) {
    setState(() {
      _url_region = region['url'];
      _region_id = region['region_id'];
      _controllerRegion.text = region['name'];
    });
    Navigator.pop(context);
  }

  void next(addLoginAndPasswordAndRegionSignUp) {
    addLoginAndPasswordAndRegionSignUp(_login, _pass, _region_id);
    Navigator.pushNamed(context, "/sign_up_2",
        arguments: ServerUrlArg(_url_region));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateStore,
        void Function(String login, String pass, int region_id)>(
      converter: (store) => (login, pass, region_id) => store.dispatch(
          AddLoginAndPasswordAndRegionSignUp(
              password: pass, login: login, region_id: region_id)),
      builder: (BuildContext context, addLoginAndPasswordAndRegionSignUp) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
              title: Text("Регистрация"),
              textTheme: Theme.of(context).textTheme),
          body: Column(children: [
            Expanded(
                child: ListView(children: [
              FormItem(
                  child: Input(
                      hint: "Введите логин", controller: _loginController),
                  top: "Логин"),
              FormItem(
                  top: "Пароль",
                  child: Input(hint: "Пароль", controller: _passController)),
              FormItem(
                top: "Сервер",
                child: SelectMimicry(
                    hint: "Выберите сервер",
                    click: () => openMenuChooseRegion(),
                    controller: _controllerRegion),
              )
            ], physics: PageScrollPhysics())),
            Container(
                child: MyButton(
                    child: "Далее",
                    disable: (_login == "" || _pass == "" || _region_id == -1),
                    click: () {
                      next(addLoginAndPasswordAndRegionSignUp);
                    }),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16))
          ]),
        );
      },
    );
  }
}
