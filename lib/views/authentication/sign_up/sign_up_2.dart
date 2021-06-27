import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/views/authentication/sign_up/server_url_argement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SignUp2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => SignUp2State();
}

class SignUp2State extends State<SignUp2> {



  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as ServerUrlArg;
    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    flutterWebviewPlugin.onUrlChanged.listen((url) { 
      print(url);
    });

    return WebviewScaffold(
      ignoreSSLErrors: true,
      resizeToAvoidBottomInset: false,
      url: arg.url + "/auth/login-page",
      appBar: AppBar(
          title: Text("Электронный дневник"),
          textTheme: Theme.of(context).textTheme),
    );
  }
}
