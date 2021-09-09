import 'package:diary_app/api/common/CommonApi.dart';
import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/placeholder.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/sign_up.dart';
import 'package:diary_app/models/account_bind.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:provider/provider.dart';

final SignUp signUp = SignUp();

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
        if (accounts_bind
                .indexWhere((e) => e.accountBind!.uuid == user!.userId) ==
            -1) {
          setState(() {
            accounts_bind.add(AccountBindView(
                name: user!.firstName + " " + user.lastName,
                photo: user.photo200,
                accountBind: AccountBind(
                    uuid: user.userId,
                    token: accessToken.token,
                    type: AccountBindTypeEnum.VK.toString())));
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
    showBarModalBottomSheet(
        context: context,
        topControl: Container(),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                  title: Text("Выберите"),
                  automaticallyImplyLeading: false,
                  textTheme: Theme.of(context).textTheme,
                  centerTitle: true),
              Container(
                child: SimpleCell(
                    child: Text(
                      "Вконтакте",
                      style: TextStyle(
                        color: null,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onClick: bindVK),
                color: Theme.of(context).backgroundColor,
              )
            ],
          );
        });
  }

  void sign_up() async {
    CommonApi api = new CommonApi();
    api.setPath("user/sign_up");
    SignUp signUp = Provider.of<SignUp>(context, listen: false);
    print(signUp);
    SignUpRequest data = new SignUpRequest(
        login: signUp.login,
        password: signUp.password,
        session: signUp.session,
        regionId:  signUp.region_id,
        accountsBind: accounts_bind.map((e) => e.accountBind!).toList());
    api.setBody(data.toJson());
    showBarModalBottomSheet(
        context: context,
        topControl: Container(),
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
                    child: MyPlaceholder(
                        child: "Это может занять некоторое время"),
                    height: 44)
              ], mainAxisSize: MainAxisSize.min),
            ),
            onWillPop: () => Future.value(true),
          );
        });
    var response = await api.request();
    print(response);
    if (response['success']) {
      ResponseSignUp res = ResponseSignUp.fromJson(response);
      Box<AuthData> box = Hive.box<AuthData>("auth_data");
      box.put("value", res.msg);

      Config config = Provider.of<Config>(context, listen: false);
  
      config.setLogin(true);
      config.addAuthData(response.msg.token, PayloadToken(user_id: response.msg.user.userId, role: response.ms.user.role));

      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    } else {
      //TODO ошибка
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            title: Text("Привязка"), textTheme: Theme.of(context).textTheme),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyPlaceholder(
                    child:
                        "Для удобства входа можете привязать различные соц.сети для доступа к аккаунту"),
              ),
              SimpleCell(
                child: Text(
                  "Добавить привязку",
                  style: TextStyle(
                    color: null,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                before: CustomIcon(
                  svgPath: "resource/icons/add_outline_28.svg",
                  type: IconType.svg,
                  size: 32,
                ),
                onClick: showModal,
              ),
              Expanded(
                  child: ListView(
                children: accounts_bind
                    .map((e) => SimpleCell(
                        child: Text(
                          e.name!,
                          style: TextStyle(
                            color: null,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        after: Image.network(e.photo!, width: 28, height: 28)))
                    .toList(),
                physics: PageScrollPhysics(),
              )),
              Container(
                  child: CustomButton(
                    mode: accounts_bind.length == 0 ? ModeCustomButton.primary : ModeCustomButton.outlined,
                    child:
                        accounts_bind.length == 0 ? "Пропустить" : "Завершить",
                    click: sign_up,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16)),
            ],
          ),
        ));
  }
}

class AccountBindView {
  String? name;
  String? photo;
  AccountBind? accountBind;
  AccountBindView({this.name, this.photo, this.accountBind});
}
