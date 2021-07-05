import 'package:diary_app/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';
import 'package:diary_app/redux/redux.dart';

class MyPlaceholder extends StatelessWidget {

  String? child;
  String? textAlign;
  double? fontSize;

  MyPlaceholder({
    this.child,
    this.textAlign = "center",
    this.fontSize = 16,
  });

  Color? textPlaceholder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        builder: (BuildContext context, theme) {
          if (theme == "light")
            textPlaceholder = LightTheme().textPlaceholder;
          else
            textPlaceholder = DarkTheme().textPlaceholder;
          return Column(children: [
            Container(
              child: Text(
                child!,
                style: TextStyle(color: textPlaceholder, fontSize: fontSize),
                textAlign: getAlign(),
              ),
            ),
          ], mainAxisAlignment: MainAxisAlignment.center);
        },
        converter: (Store<StateStore> store) => store.state.theme);
  }

  TextAlign? getAlign() {
    switch (this.textAlign) {
      case "left":
        return TextAlign.left;
      case "center":
        return TextAlign.center;
      case "right":
        return TextAlign.right;
    }
  }
}
