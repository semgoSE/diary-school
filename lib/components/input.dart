import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'colors.dart';

class Input extends StatefulWidget {
  String hint;
  TextInputAction textInputAction;
  Function? function;
  bool isPass;
  FocusNode? focusNode;

  Input({
    this.hint = "",
    this.textInputAction = TextInputAction.done,
    this.function,
    this.isPass = false,
    this.focusNode,
  });

  @override
  _InputState createState() => _InputState(
        hint: hint,
        textInputAction: textInputAction,
        function: function,
        isPass: isPass,
        focusNode: focusNode,
      );
}

class _InputState extends State<Input> {
  String? hint;
  TextInputAction? textInputAction;
  Function? function;
  bool? isPass;
  FocusNode? focusNode;

  Map<String, Color>? colors;
  Color? accentColor;

  _InputState({
    this.hint,
    this.textInputAction,
    this.function,
    this.isPass,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<StateStore, String>(
      converter: (store) => store.state.theme,
      builder: (context, theme) {
        if (theme == "light") {
          this.colors = LightTheme().field;
          this.accentColor = LightTheme().accent;
        } else if (theme == "dark") {
          this.colors = DarkTheme().field;
          this.accentColor = DarkTheme().accent;
        }
        return TextFormField(
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: colors!['field_background'],
              contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: (colors!['field_border'])!)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: (accentColor)!),
              )),
        );
      },
    );
  }
}
