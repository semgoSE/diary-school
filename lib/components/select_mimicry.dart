import 'package:diary_app/components/colors.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SelectMimicry extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  Function? click;
  FocusNode? focusNode;

  Map<String, Color>? colors;
  Color? accentColor;
  Color? textPrimary;
  Color? textPlaceholder;

  SelectMimicry({this.hint = "", this.controller, this.click, this.focusNode});

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
                child: MyIcon(
                  type: IconType.svg,
                  svgPath: "resource/icons/dropdown_16.svg",
                  colorMode: ColorMode.placeholder,
                  //size: 14,
                ),
              ), //TODO доделать эту херню
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
