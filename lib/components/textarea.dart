
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


import 'colors.dart';

class Textarea extends StatelessWidget {
  String? hint;
  TextInputAction? textInputAction;
  void Function(String)? onSubmit;
  bool isPass;
  FocusNode? focusNode;
  TextEditingController? controller;
  TextareaStatus status;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  Widget? suffix;
  Widget? suffixIcon;

  CustomTheme? colors;
  Color? accentColor;
  Color? textPrimary;
  Color? textPlaceholder;


  Textarea(
      {this.hint,
      this.textInputAction = TextInputAction.done,
      this.onSubmit,
      this.isPass = false,
      this.focusNode,
      this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.suffix,
      this.suffixIcon,
      this.status = TextareaStatus.def});

  Color? getColorByStatus() {
    switch (status) {
      case TextareaStatus.def:
        return colors!.field_border;
      case TextareaStatus.error:
        return colors!.field_error_border;

      case TextareaStatus.valid:
        return colors!.field_valid_border;
    }
  }

  Color? getBackgroundByStatus() {
    switch (status) {
      case TextareaStatus.def:
        return colors!.field_background;
      case TextareaStatus.error:
        return colors!.field_error_background;

      case TextareaStatus.valid:
        return colors!.field_background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Observer(
      builder: (_) {
        Config config = Provider.of<Config>(context, listen: false);
        this.colors = config.customTheme;
        this.accentColor = config.customTheme.accent;
        this.textPrimary = config.customTheme.text_primary;
        this.textPlaceholder = config.customTheme.text_placeholder;
        return TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onFieldSubmitted: onSubmit,
          style: TextStyle(fontSize: 16, color: textPrimary),
          obscureText: isPass,
          autocorrect: !isPass,
          controller: controller!,
          textInputAction: textInputAction,
          maxLines: 5,
          decoration: InputDecoration(
              // labelText: 'FFFF',
              suffix: suffix,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(fontSize: 16, color: textPlaceholder),
              hintText: hint,
              filled: true,
              fillColor: getBackgroundByStatus(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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

enum TextareaStatus { def, error, valid }
