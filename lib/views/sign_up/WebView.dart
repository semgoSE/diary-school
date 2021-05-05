import 'package:dairy_app/views/sign_up/WebViewArgs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(Object context) {
    final WebViewArgs args =
        ModalRoute.of(context).settings.arguments as WebViewArgs;

    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (args.url_end == url) {
        Navigator.pushNamed(context, '/sign_up_2');
      }
    });

    return (WebviewScaffold(
      ignoreSSLErrors: true,
      appBar: AppBar(
        backgroundColor: HexColor("#ffffff"),
        leading: BackButton(
          color: HexColor("#000000"),
        ),
        title: Text(
          args.header,
          style: TextStyle(color: HexColor("#000000")),
        ),
      ),
      url: args.url,
    ));
  }
}
