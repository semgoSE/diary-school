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
  InputStatus status;
  FocusNode? focusNode;

  Input(
      {this.hint = "",
      this.textInputAction = TextInputAction.done,
      this.function,
      this.isPass = false,
      this.focusNode,
      this.status = InputStatus.def,
      this.controller});

  @override
  _InputState createState() => _InputState(
      hint: hint,
      textInputAction: textInputAction,
      function: function,
      isPass: isPass,
      focusNode: focusNode,
      status: status,
      controller: controller);
}

class _InputState extends State<Input> {
  String? hint;
  TextInputAction? textInputAction;
  Function? function;
  bool? isPass;
  FocusNode? focusNode;
  TextEditingController? controller;
  InputStatus status;

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
      this.controller,
      required this.status});

  Color? getColorByStatus() {
    switch (status) {
      case InputStatus.def:
        return colors!['field_border'];
      case InputStatus.error:
        return colors!['field_error_border'];

      case InputStatus.valid:
        return colors!['field_valid_border'];
    }
  }

  Color? getBackgroundByStatus() {
    switch (status) {
      case InputStatus.def:
        return colors!['field_background'];
      case InputStatus.error:
        return colors!['field_error_background'];

      case InputStatus.valid:
        return colors!['field_background'];
    }
  }

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
          obscureText: isPass!,
          autocorrect: !isPass!,
          controller: controller,
          decoration: InputDecoration(
              // labelText: 'FFFF',
              hintStyle: TextStyle(fontSize: 16, color: textPlaceholder),
              hintText: hint,
              filled: true,
              fillColor: getBackgroundByStatus(),
              contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: getColorByStatus()!)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: (accentColor)!),
              )),
        );
      },
    );
  }
}

enum InputStatus { def, error, valid }
