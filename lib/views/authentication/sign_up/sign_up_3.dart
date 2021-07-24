import 'package:diary_app/api/common/CommonApi.dart';
import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/placeholder.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/models/account_bind.dart';
import 'package:diary_app/models/index.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';

class SignUp3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp3State();
}

class SignUp3State extends State<SignUp3> {

  List<AccountBindView> accounts_bind = [];
  late SignUp _signUp;

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
        if(accounts_bind.indexWhere((e) => e.accountBind!.uuid == user!.userId) == -1) {
          setState(() {
            accounts_bind.add(AccountBindView(name: user!.firstName + " " + user.lastName, photo: user.photo200, accountBind: AccountBind(uuid: user.userId, token: accessToken.token, type: AccountBindTypeEnum.VK.toString())));
          });
        } else {
          //ToDO показываем ошибку 
        }
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
          Container(child: SimpleCell(child: "Вконтакте", onClick: bindVK), color: Theme.of(context).backgroundColor,)
        ],
      );
    });
  }

  void sign_up() async  {
    CommonApi api = new CommonApi();
    api.setPath("user/sign_up");
    SignUpRequest data = new SignUpRequest(login: _signUp.login!, password: _signUp.password!, session: _signUp.session!, accountsBind: accounts_bind.map((e) => e.accountBind!).toList());
    api.setBody(data.toJson());
    showBarModalBottomSheet(context: context, topControl: Container(), builder: (context) {
      return WillPopScope(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(children: [
            AppBar(title: Text("Авторизация"), centerTitle: true, textTheme: Theme.of(context).textTheme, automaticallyImplyLeading: false),
            Container(child: Spinner()),
            Container(child: MyPlaceholder(child: "Это может занять некоторое время"), height: 44)
          ], mainAxisSize: MainAxisSize.min),
        ),
        onWillPop: () => Future.value(false),
      );
    });
    var response = await api.request();
    print(response);
    if(response['success']) {
        ResponseSignUp res = ResponseSignUp.fromJson(response);
        //TODO еще какая то херня
    } else {
      //TODO ошибка
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateStore,SignUp>(
      converter: (store) => store.state.signUp,
      builder: (BuildContext context, signUp) {
        _signUp = signUp;
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
                title: Text("Привязка"),
                textTheme: Theme.of(context).textTheme),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyPlaceholder(child: "Для удобства входа можете привязать различные соц.сети для доступа к аккаунту"),
                  ),
                  SimpleCell(
                    child: "Добавить привязку",
                    before: MyIcon(svgPath: "resource/icons/add_outline_28.svg", type: IconType.svg, size: 32,),
                    onClick: showModal,
                  ),
                  Expanded(child: ListView(children: 
                    accounts_bind.map((e) => SimpleCell(child: e.name!, after: Image.network(e.photo!, width: 28, height: 28))).toList(),
                    physics: PageScrollPhysics(),
                  )),
                   Container(child: MyButton(
                    mode: accounts_bind.length == 0 ? "primary" : "commerce",
                    child: accounts_bind.length == 0 ? "Пропустить" : "Завершить",
                    click: sign_up,
                  ), padding: EdgeInsets.symmetric(vertical: 16)),
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