import 'package:dairy_app/components/Avatar.dart';
import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Cell.dart';
import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:dairy_app/data/AccountBind.dart';
import 'package:dairy_app/data/AuthData.dart';
import 'package:dairy_app/views/sign_up/Dairy.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_icons/flutter_icons.dart';

// const List<String> users = <String>["Tom", "Alice", "Bob", "Sam", "Kate"];

class SignUp_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp_2State();
}

class SignUp_2State extends State {
  List<AccountBind> accounts_bind = Dairy.accounts_bind;

  void auth(Object context) async {
    var vk = VKLogin();
    await vk.initSdk("7847370");
    var res = await vk.logIn();
    if (res.isValue) {
      final VKLoginResult data = res.asValue.value;
      if (!data.isCanceled) {
        final VKAccessToken accessToken = data.accessToken;
        final d = await vk.getUserProfile();
        final VKUserProfile user = d.asValue.value;
        setState(() {
          Dairy.addUser(
              user.userId,
              user.firstName + " " + user.lastName,
              user.photo200,
              AuthData(token: accessToken.token, id: user.userId));
          accounts_bind = Dairy.accounts_bind;
        });
        vk.logOut();
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(Object context) {
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
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                child: TitleLevel_1("#2 - Привязка"),
                padding: EdgeInsets.symmetric(vertical: 32),
              ),
              Container(
                child: Placeholder2(
                    description:
                        "Для удобства входа можете привязать различные соц. сети."),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              ...accounts_bind
                  .map((e) => Cell(
                        before: Avatar(src: e.img),
                        header: e.name,
                        click: () {
                          showBarModalBottomSheet(
                              context: context,
                              builder: (_) => Container(
                                  height: 270,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        child: Avatar(
                                          src: e.img,
                                          size: 56,
                                        ),
                                      ),
                                      TitleLevel_1(e.name),
                                      ButtonDestructive(
                                        text: "Удалить",
                                        click: () {
                                          Dairy.removeUser(e.id);
                                          setState(() {
                                            accounts_bind = Dairy.accounts_bind;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  )));
                        },
                        description: "Вконтакте",
                      ))
                  .toList(),
              ButtonCell(
                icon: Ionicons.md_add,
                text: "Добавить привязку",
                click: () => {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return (Container(
                            color: HexColor("#ffffff"),
                            height: 110,
                            child: Column(children: [
                              Container(
                                height: 48,
                                child: TitleLevel_1("Добавление привязки"),
                              ),
                              Cell(
                                header: "Вконтакте",
                                description: "Социальная сеть",
                                after: Icon(SimpleLineIcons.login),
                                click: () {
                                  auth(context);
                                },
                                before: CircleAvatar(
                                  child: Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/VK_Compact_Logo.svg/190px-VK_Compact_Logo.svg.png"),
                                ),
                              ),
                            ])));
                      })
                },
              )
            ],
          )),
          ButtonPrimary(
            text: "Далее",
            click: () {
              print("dsfsf");
              Navigator.pushNamed(context, '/sign_up_3');
            },
          )
        ],
      ),
    ));
  }
}
