import 'package:diary_app/api/common/CommonApi.dart';
import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/screen_spinner.dart';
import 'package:diary_app/components/select_mimicry.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/mobX/sign_up.dart';
import 'package:diary_app/models/index.dart';

import 'package:diary_app/views/authentication/sign_up/server_url_argement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';



class SignUp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp1State();
}

class SignUp1State extends State<SignUp1> {


  bool needCheck = false; //флаг нужно ли проверять порля на наличие ошибок

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  List<Map<String, dynamic>> regions = [
    {
      "region_id": 1,
      "name": "Рязанская область",
      "url": "https://e-school.ryazangov.ru"
    }
  ];

  String _login = "";
  FormItemStatus _loginStatus = FormItemStatus.def;
  String _loginError = "";

  String _pass = "";
  String _url_region = "";
  TextEditingController _controllerRegion = TextEditingController();
  int _region_id = -1;

  bool isHidePass = true;

  void initState() {
    _loginController.addListener(() {
      setState(() {
        _loginStatus = FormItemStatus.def;
        _loginError = "";
        _login = _loginController.value.text;
      });
    });

    _passController.addListener(() {
      setState(() {
        _pass = _passController.value.text;
      });
    });
  }

  Future<bool> checkLogin(String login) async {
    CommonApi api = new CommonApi();
    api.setPath("user/check-login");
    api.setBody(RequestCheckLogin(login: login).toJson());
    var res = await api.request();
    print(res);
    if(res != null) {
      if(res['success']) {
        ResponseCheckLogin response = ResponseCheckLogin.fromJson(res);
        Navigator.pop(context);
        if(response.msg == "ok") {
          return true;
        } else return false;
      } else {
        ResponseCheckLogin response = ResponseCheckLogin.fromJson(res);
        Navigator.pop(context);
        setState(() {
          _loginStatus = FormItemStatus.error;  
          _loginError = response.msg;
        });
        return false;
      }
    } else {
      // Navigator.pop(context);
      setState(() {
        _loginStatus = FormItemStatus.error;  
      });
      return false;
    }
  }

  void openMenuChooseRegion() {
    showBarModalBottomSheet(
      context: context,
      topControl: Container(),
      builder: (context) => Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            AppBar(
                title: Text("Выберите регион"),
                automaticallyImplyLeading: false,
                textTheme: Theme.of(context).textTheme,
                centerTitle: true),
            ...regions
                .map((e) => SimpleCell(
                    child: Text(e['name'], style: TextStyle(fontSize: 17),),
                    onClick: () => chooseRegion(e)))
                .toList()
          ],
          mainAxisSize: MainAxisSize.min,
        ),
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

  void next() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    showDialog(context: context, builder: (context) => WillPopScope(child: ScreenSpinner(), onWillPop: () => Future.value(true)), barrierDismissible: false);
    if(_login.length >= 6) { //проверяем логин согласно требованиям
      bool loginValid = await checkLogin(_login);
      if(loginValid) {
        Provider.of<SignUp>(context, listen: false).setSignUp1(_login, _pass, regions[_region_id]['region_id']);
        Navigator.pushNamed(context, "/sign_up_2",
            arguments: ServerUrlArg(_url_region));
      }
    } else {
      Navigator.pop(context);
      setState(() {
        _loginStatus = FormItemStatus.error;
        _loginError = "Лоигин слишком короткий";        
      });
    }

  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
              title: Text("Регистрация"),
              textTheme: Theme.of(context).textTheme),
          body: Column(children: [
            Expanded(
                child: ListView(children: [
              FormItem(
                  status: _loginStatus,
                  bottom:_loginError ,
                  child: Input(
                      status: _loginStatus == FormItemStatus.def ? InputStatus.def : InputStatus.error,
                      keyboardType: TextInputType.text,
                      inputFormatters: [ 
                        LengthLimitingTextInputFormatter(18),
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_]')),
                      ],
                      textInputAction: TextInputAction.next,
                      hint: "Введите логин", controller: _loginController),
                  top: "Логин"),
              FormItem(
                  top: "Пароль",
                  child: Input(
                      isPass: isHidePass,
                      keyboardType: TextInputType.text,
                      suffixIcon:  isHidePass
                    ? IconButton(
                        splashRadius: 10,
                        icon: CustomIcon(
                          type: IconType.svg,
                          colorMode: ColorMode.placeholder,
                          svgPath: "resource/icons/view_outline_28.svg",
                        ),
                        onPressed: () {
                          setState(() {
                            isHidePass = false;
                          });
                        },
                      )
                    : IconButton(
                        splashRadius: 10,
                        icon: CustomIcon(
                          type: IconType.svg,
                          colorMode: ColorMode.placeholder,
                          svgPath: "resource/icons/hide_outline_28.svg",
                        ),
                        onPressed: () {
                          setState(() {
                            isHidePass = true;
                          });
                        },
                      ),
                      textInputAction: TextInputAction.next,
                      onSubmit: (String pass) {
                        openMenuChooseRegion();
                      },
                      inputFormatters: [ 
                        LengthLimitingTextInputFormatter(18),
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9_@#*%]")),
                    ],
                    hint: "Пароль", controller: _passController)),
              FormItem(
                top: "Регион",
                child: SelectMimicry(
                    hint: "Выберите регион",
                    click: openMenuChooseRegion,
                    controller: _controllerRegion),
              )
            ], physics: PageScrollPhysics())),
            Container(
                child: CustomButton(
                    child: "Далее",
                    disable: (_login.length < 6 || _pass.length < 4 || _region_id == -1),
                    click: () {
                      next();
                    }),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16))
          ]),
        );
  }
}
