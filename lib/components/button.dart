import 'package:diary_app/components/colors.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class CustomButton extends StatelessWidget {
  String? child;
  bool disable;

  //size = ["s", "m", "l"]
  String? size;

  //mode = ["commerce", "primary", "secondary", "outlined"]
  String? mode;
  Function? click;

  CustomButton(
      {this.mode = "primary",
      this.size = "m",
      this.click,
      this.child,
      this.disable = false});

  Color? accentColor;
  CustomTheme? colors;

  @override
  Widget build(BuildContext context) {
    return new Observer(
      builder: (_) {
        Config config = Provider.of<Config>(context, listen: false);
        this.colors = config.customTheme;
        this.accentColor = config.customTheme.accent;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: disable ? getBorder(context)!.withOpacity(0.6) : getBorder(context)!,
            ),
            borderRadius: BorderRadius.circular(8.0),
            color: disable
                ? getBackground(context)!.withOpacity(0.6)
                : getBackground(context),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: disable ? Colors.transparent : null,
              highlightColor: disable ? Colors.transparent : null,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () => disable ? null : click!(),
              child: Container(
                padding: EdgeInsets.all(getSize()!),
                width: double.infinity,
                child: Center(
                  child: Text(
                    child!,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: disable
                          ? getForeground()!.withOpacity(0.6)
                          : getForeground(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double? getSize() {
    switch (size) {
      case "s":
        return 4;
      case "m":
        return 8;
      case "l":
        return 12;
    }
  }

  //цвет текста
  Color? getForeground() {
    switch (this.mode) {
      case "commerce":
        return colors!.button_commerce_foreground;

      case "primary":
        return colors!.button_primary_foreground;

      case "secondary":
        return colors!.button_secondary_foreground;

      case "outlined":
        return colors!.button_outline_foreground;
    }
  }

  //цвет фона
  Color? getBackground(BuildContext context) {
    switch (this.mode) {
      case "commerce":
        return colors!.button_commerce_background;

      case "primary":
        return colors!.button_primary_background;

      case "secondary":
        return colors!.button_secondary_background;

      case "outlined":
        return Theme.of(context).backgroundColor;
    }
  }

  //цвет рамки
  Color? getBorder(BuildContext context) {
    switch (this.mode) {
      case "commerce":
        return Theme.of(context).backgroundColor;

      case "primary":
        return Theme.of(context).backgroundColor;

      case "secondary":
        return Theme.of(context).backgroundColor;

      case "outlined":
        return colors!.button_outline_border;
    }
  }
}
