import 'package:dairy_app/helpers/WebViewArgs.dart';
import 'package:dairy_app/views/sign_up/Dairy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(Object context) {
    final WebViewArgs args =
        ModalRoute.of(context).settings.arguments as WebViewArgs;

    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    final cookieManager = WebviewCookieManager();

    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      print(url + " " + args.url_end);
      if (args.url_end == url) {
        final gotCookies = await cookieManager.getCookies(url);
        for (var item in gotCookies) {
          if (item.name == "sessionid") {
            Dairy.cookies = item.value;
            break;
          }
        }
        Navigator.pushNamed(context, "/sign_up_2");
        flutterWebviewPlugin.close();
        flutterWebviewPlugin.dispose();
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
