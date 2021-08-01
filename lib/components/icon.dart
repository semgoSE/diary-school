import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors.dart';

final config = Config();

class MyIcon extends StatelessWidget {
  IconData? iconData;
  String? svgPath;
  double? size;
  ColorMode colorMode;

  IconType type; // "icon" / "svg"

  MyIcon(
      {this.iconData,
      this.svgPath,
      this.size = 28,
      this.colorMode = ColorMode.accent,
      this.type = IconType.icon});

  Color? accentColor;
  Map<String, Color>? colors;

  @override
  Widget build(BuildContext context) {
    return new Observer(
      builder: (_) {
        if (config.theme == ThemeConfig.light) {
          this.colors = LightTheme().icons;
          this.accentColor = LightTheme().accent;
        } else if (config.theme == ThemeConfig.dark) {
          this.colors = DarkTheme().icons;
          this.accentColor = DarkTheme().accent;
        }
        return setIcon();
      },
    );
  }

  Color? getIconColor() {
    switch (colorMode) {
      case ColorMode.accent:
        return accentColor;
      case ColorMode.name:
        return colors!["icon_name"];
      case ColorMode.placeholder:
        return colors!["icon_secondary"];
    }
  }

  dynamic setIcon() {
    if (this.type == IconType.icon) {
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


enum IconType { svg, icon }
enum ColorMode { accent, name, placeholder }