import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'colors.dart';

class Input extends StatefulWidget {
  String hint;
  TextEditingController? controller;
  TextInputAction textInputAction;
  Function? function;
  bool isPass;
  FocusNode? focusNode;

  Input(
      {this.hint = "",
      this.textInputAction = TextInputAction.done,
      this.function,
      this.isPass = false,
      this.focusNode,
      this.controller});

  @override
  _InputState createState() => _InputState(
      hint: hint,
      textInputAction: textInputAction,
      function: function,
      isPass: isPass,
      focusNode: focusNode,
      controller: controller);
}

class _InputState extends State<Input> {
  String? hint;
  TextInputAction? textInputAction;
  Function? function;
  bool? isPass;
  FocusNode? focusNode;
  TextEditingController? controller;

  Map<String, Color>? colors;
  Color? accentColor;
  Color? textPrimary;
  Color? textPlaceholder;

  _InputState(
      {this.hint,
      this.textInputAction,
      this.function,
      this.isPass,
      this.focusNode,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<StateStore, String>(
      converter: (store) => store.state.theme,
      builder: (context, theme) {
        if (theme == "light") {
          this.colors = LightTheme().field;
          this.accentColor = LightTheme().accent;
          this.textPrimary = LightTheme().textPrimary;
          this.textPlaceholder = LightTheme().textPlaceholder;
        } else if (theme == "dark") {
          this.colors = DarkTheme().field;
          this.accentColor = DarkTheme().accent;
          this.textPrimary = DarkTheme().textPrimary;
          this.textPlaceholder = DarkTheme().textPlaceholder;
        }
        return TextFormField(
          style: TextStyle(fontSize: 16, color: textPrimary),
          decoration: InputDecoration(
              // labelText: 'FFFF',
              hintStyle: TextStyle(fontSize: 16, color: textPlaceholder),
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
