import 'package:diary_app/components/colors.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final config = Config();

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
    return Observer(
        builder: (_) {
          if (config.theme == ThemeConfig.light)
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
        });
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
