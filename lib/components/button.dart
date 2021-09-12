import 'package:diary_app/components/colors.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

enum SizeCustomButton { s, m, l }
enum ModeCustomButton { commerce, primary, secondary, outlined }

class CustomButton extends StatelessWidget {
  String? child;
  bool disable;

  //size = ["s", "m", "l"]
  SizeCustomButton? size;

  //mode = ["commerce", "primary", "secondary", "outlined"]
  ModeCustomButton? mode;
  Function? click;

  CustomButton(
      {this.mode = ModeCustomButton.primary,
      this.size = SizeCustomButton.m,
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
      case SizeCustomButton.s:
        return 4;
      case SizeCustomButton.m:
        return 8;
      case SizeCustomButton.l:
        return 12;

      default: 
        return 8;
    }
  }

  //цвет текста
  Color? getForeground() {
    switch (this.mode) {
      case ModeCustomButton.commerce:
        return colors!.button_commerce_foreground;

      case ModeCustomButton.primary:
        return colors!.button_primary_foreground;

      case ModeCustomButton.secondary:
        return colors!.button_secondary_foreground;

      case ModeCustomButton.outlined:
        return colors!.button_outline_foreground;

      default: 
        return colors!.button_primary_foreground;
    }
  }

  //цвет фона
  Color? getBackground(BuildContext context) {
    switch (this.mode) {
      case ModeCustomButton.commerce:
        return colors!.button_commerce_background;

      case ModeCustomButton.primary:
        return colors!.button_primary_background;

      case ModeCustomButton.secondary:
        return colors!.button_secondary_background;

      case ModeCustomButton.outlined:
        return Theme.of(context).backgroundColor;

      default:
        return colors!.button_primary_background;
    }
  }

  //цвет рамки
  Color? getBorder(BuildContext context) {
    switch (this.mode) {
      case ModeCustomButton.commerce:
        return Theme.of(context).backgroundColor;

      case ModeCustomButton.primary:
        return Theme.of(context).backgroundColor;

      case ModeCustomButton.secondary:
        return Theme.of(context).backgroundColor;

      case ModeCustomButton.outlined:
        return colors!.button_outline_border;
      
      default: 
        return Theme.of(context).backgroundColor;
    }
  }
}
