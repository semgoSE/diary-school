import 'package:diary_app/components/colors.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyButton extends StatelessWidget {
  String? child;
  bool disable;

  //size = ["s", "m", "l"]
  String? size;

  //mode = ["commerce", "primary", "secondary", "outlined"]
  String? mode;
  Function? click;

  MyButton(
      {this.mode = "primary",
      this.size = "m",
      this.click,
      this.child,
      this.disable = false});

  Color? accentColor;
  Map<String, Color>? colors;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<StateStore, String>(
      converter: (store) => store.state.theme,
      builder: (context, theme) {
        if (theme == "light") {
          this.colors = LightTheme().button;
          this.accentColor = LightTheme().accent;
        } else if (theme == "dark") {
          this.colors = DarkTheme().button;
          this.accentColor = DarkTheme().accent;
        }
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: getBorder()!),
            borderRadius: BorderRadius.circular(8.0),
            color:
                disable ? getBackground()!.withOpacity(0.6) : getBackground(),
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
        return 12;
      case "m":
        return 14;
      case "l":
        return 16;
    }
  }

  //цвет текста
  Color? getForeground() {
    switch (this.mode) {
      case "commerce":
        return colors!['button_commerce_foreground'];

      case "primary":
        return colors!['button_primary_foreground'];

      case "secondary":
        return colors!['button_secondary_foreground'];

      case "outlined":
        return colors!['button_outline_foreground'];
    }
  }

  //цвет фона
  Color? getBackground() {
    switch (this.mode) {
      case "commerce":
        return colors!['button_commerce_background'];

      case "primary":
        return colors!['button_primary_background'];

      case "secondary":
        return colors!['button_secondary_background'];

      case "outlined":
        return Color.fromRGBO(0, 0, 0, 0);
    }
  }

  //цвет рамки
  Color? getBorder() {
    switch (this.mode) {
      case "commerce":
        return Color.fromRGBO(0, 0, 0, 0);

      case "primary":
        return Color.fromRGBO(0, 0, 0, 0);

      case "secondary":
        return Color.fromRGBO(0, 0, 0, 0);

      case "outlined":
        return colors!['button_outline_border'];
    }
  }
}
