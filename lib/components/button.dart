import 'package:diary_app/components/colors.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyButton extends StatelessWidget {
  String? child;
  bool? disable;
  String? mode;
  Function? click;

  MyButton({this.mode, this.click, this.child, this.disable});

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
            borderRadius: BorderRadius.circular(8.0),
            color: accentColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () => click!(),
              child: Container(
                padding: EdgeInsets.all(12.0),
                width: double.infinity,
                child: Center(child: Text(child!)),
              ),
            ),
          ),
        );
      },
    );
  }
}
