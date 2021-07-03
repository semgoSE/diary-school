import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/models/AccountBind.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';

class SignUp3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp3State();
}

class SignUp3State extends State<SignUp3> {

  List<AccountBindView> accounts_bind = [];

  void bindVK() async {
    var vk = VKLogin();
    await vk.initSdk("7847370");
    var res = await vk.logIn();
    if (res.isValue) {
      final VKLoginResult data = res.asValue!.value;
      if (!data.isCanceled) {
        final VKAccessToken accessToken = data.accessToken!;
        final d = await vk.getUserProfile();
        final VKUserProfile? user = d.asValue!.value;
        setState(() {
          accounts_bind.add(AccountBindView(name: user!.firstName + " " + user.lastName, photo: user.photo200, accountBind: AccountBind(uuid: user.userId, token: accessToken.token)));
        });
        vk.logOut();
        Navigator.pop(context);
      }
    }
  }

  void showModal() {
    showBarModalBottomSheet(context: context, builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
              title: Text("Выберите"),
              automaticallyImplyLeading: false,
              textTheme: Theme.of(context).textTheme,
              centerTitle: true),
          SimpleCell(child: Text("Вконтакте"), onClick: bindVK)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateStore,SignUp>(
      converter: (store) => store.state.signUp,
      builder: (BuildContext context, signUp) {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
                title: Text("Привязка"),
                textTheme: Theme.of(context).textTheme),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text("Для удобства входа можете привязать различные соц.сети для доступа к аккаунту"),
                  ),
                  
                  SimpleCell(
                    child: Text("Добавить привязку"),
                    before: Icon(Icons.add),
                  ),
                  Expanded(child: ListView(children: 
                    accounts_bind.map((e) => SimpleCell(child: Text(e.name!))).toList(),
                    physics: PageScrollPhysics(),
                  )),
                   Container(child: MyButton(
                    mode: "commerce",
                    child: "Готов",
                    click: () => {},
                  ), padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16 )),
                ],
              ),
            ));
      },
    );
  }
}


class AccountBindView {
  String? name;
  String? photo;
  AccountBind? accountBind;
  AccountBindView({ this.name, this.photo, this.accountBind});
}