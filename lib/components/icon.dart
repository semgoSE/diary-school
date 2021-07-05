import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors.dart';

class MyIcon extends StatelessWidget {
  IconData? iconData;
  String? svgPath;
  double? size;
  String? colorMode;

  String? type; // "icon" / "svg"

  MyIcon(
      {this.iconData,
      this.svgPath,
      this.size = 28,
      this.colorMode = "accent",
      this.type = "icon"});

  Color? accentColor;
  Map<String, Color>? colors;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<StateStore, String>(
      converter: (store) => store.state.theme,
      builder: (context, theme) {
        if (theme == "light") {
          this.colors = LightTheme().icons;
          this.accentColor = LightTheme().accent;
        } else if (theme == "dark") {
          this.colors = DarkTheme().icons;
          this.accentColor = DarkTheme().accent;
        }
        return setIcon();
      },
    );
  }

  Color? getIconColor() {
    switch (colorMode) {
      case "accent":
        return accentColor;
        break;
      case "name":
        return colors!["icon_name"];
        break;
    }
  }

  dynamic setIcon() {
    if (this.type == "icon") {
      return Icon(
        iconData,
        color: getIconColor(),
        size: this.size,
      );
    } else {
      return SvgPicture.asset(
        svgPath!,
        color: getIconColor(),
        height: this.size,
        width: this.size,
      );
    }
  }
}
