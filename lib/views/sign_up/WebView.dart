import 'package:dairy_app/views/sign_up/WebViewArgs.dart';
import 'package:flutter/cupertino.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(Object context) {
    final WebViewArgs args =
        ModalRoute.of(context).settings.arguments as WebViewArgs;
  }
}
