import 'dart:io';
import 'dart:math';

import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/redux/actions/SignUpSetSession.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:diary_app/views/authentication/sign_up/server_url_argement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class SignUp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp2State();
}

class SignUp2State extends State<SignUp2> {
  FlutterWebviewPlugin? webView;
  Function? setSession;

  //получаем куки
  void setCookie(String url) async {
    final cookieManager = WebviewCookieManager();
    List<Cookie> gotCookies = await cookieManager.getCookies(url);
    for (var item in gotCookies) {
      if (item.name == "sessionid") {
        setSession!(item.value);
      }
    }
    webView!.close();
    Navigator.popAndPushNamed(context, "/sign_up_3");
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as ServerUrlArg;
    webView = new FlutterWebviewPlugin();
    webView!.onUrlChanged.listen((url) {
      if (url.indexOf("#diary") != -1) {
        setCookie(url);
      }
    });

    return StoreConnector<StateStore, void Function(String session)>(
        builder: (context, setSession) {
          this.setSession = setSession;
          return WebviewScaffold(
            ignoreSSLErrors: true,
            resizeToAvoidBottomInset: false,
            url: arg.url + "/auth/login-page",
            appBar: AppBar(
                title: Text("Электронный дневник"),
                textTheme: Theme.of(context).textTheme),
          );
        },
        converter: (store) =>
            (session) => store.dispatch(SignUpSetSession(session)));
  }
}
