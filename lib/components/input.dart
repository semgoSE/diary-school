
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


import 'colors.dart';

class Input extends StatelessWidget {
  String? hint;
  TextInputAction? textInputAction;
  Function? function;
  bool isPass;
  FocusNode? focusNode;
  TextEditingController? controller;
  InputStatus status;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;

  CustomTheme? colors;
  Color? accentColor;
  Color? textPrimary;
  Color? textPlaceholder;


  Input(
      {this.hint,
      this.textInputAction = TextInputAction.done,
      this.function,
      this.isPass = false,
      this.focusNode,
      this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.status = InputStatus.def});

  Color? getColorByStatus() {
    switch (status) {
      case InputStatus.def:
        return colors!.field_border;
      case InputStatus.error:
        return colors!.field_error_border;

      case InputStatus.valid:
        return colors!.field_valid_border;
    }
  }

  Color? getBackgroundByStatus() {
    switch (status) {
      case InputStatus.def:
        return colors!.field_background;
      case InputStatus.error:
        return colors!.field_error_background;

      case InputStatus.valid:
        return colors!.field_background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Observer(
      builder: (_) {
        Config config = Provider.of<Config>(context, listen: false);
          this.colors = config.customTheme;
          this.accentColor = LightTheme().accent;
          this.textPrimary = LightTheme().text_primary;
          this.textPlaceholder = LightTheme().text_placeholder;
        return TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: TextStyle(fontSize: 16, color: textPrimary),
          obscureText: isPass,
          autocorrect: !isPass,
          controller: controller!,
          textInputAction: textInputAction,
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
