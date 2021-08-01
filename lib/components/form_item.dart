import 'package:diary_app/components/colors.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class FormItem extends StatelessWidget {
  String? top;
  String? bottom;
  Widget? child;

  FormItemStatus status;

  var colors;

  FormItem(
      {this.top = "",
      this.bottom = "",
      this.child,
      this.status = FormItemStatus.def});

  Color? getColorByStatus() {
    switch (status) {
      case FormItemStatus.def:
        return colors.textSecondary;
      case FormItemStatus.error:
        return colors.field['field_error_border'];

      case FormItemStatus.valid:
        return colors.field['field_valid_border'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Observer(
        builder: (_) {
          if (config.theme == ThemeConfig.light) {
            this.colors = LightTheme();
          } else {
            this.colors = DarkTheme();
          }
          return Container(
              child: Column(
                  children: [
                    top != ""
                        ? Container(
                            child: Text(top!,
                                style: TextStyle(
                                    color: colors.textSecondary, fontSize: 14)),
                            padding: EdgeInsets.only(bottom: 8, left: 2))
                        : Container(),
                    Container(child: child),
                    bottom != ""
                        ? Container(
                            child: Text(bottom!,
                                style: TextStyle(
                                    fontSize: 14, color: getColorByStatus())),
                            padding: EdgeInsets.only(top: 8, left: 2))
                        : Container()
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12));
        },
        ));
  }
}

enum FormItemStatus { valid, error, def }
