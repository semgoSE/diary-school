import 'package:diary_app/components/colors.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SelectMimicry extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  Function? click;
  FocusNode? focusNode;

  CustomTheme? colors;
  Color? accentColor;
  Color? textPrimary;
  Color? textPlaceholder;

  SelectMimicry({this.hint = "", this.controller, this.click, this.focusNode});

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
          controller: controller,
          focusNode: focusNode,
          readOnly: true,
          onTap: () => click!(),
          showCursor: false,
          style: TextStyle(fontSize: 16, color: textPrimary),
          decoration: InputDecoration(
              // labelText: 'FFFF',
              hintStyle: TextStyle(fontSize: 16, color: textPlaceholder),
              hintText: hint,
              filled: true,
              // suffixIcon: Text("fdd"),
              suffixIconConstraints: BoxConstraints(maxHeight: 32, maxWidth: 32),
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 8.0),
                child: CustomIcon(
                  type: IconType.svg,
                  svgPath: "resource/icons/dropdown_16.svg",
                  colorMode: ColorMode.placeholder,
                  //size: 14,
                ),
              ),
              fillColor: colors!.field_background,
              contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors?.field_border ?? Colors.black)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: (accentColor)!),
              )),
        );
      },
    );
  }
}
