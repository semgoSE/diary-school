import 'package:diary_app/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';
import 'package:diary_app/redux/redux.dart';

class MyPlaceholder extends StatelessWidget {
  String? child;

  MyPlaceholder({this.child});

  Color? textPlaceholder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        builder: (BuildContext context, theme) {
          if (theme == "light")
            textPlaceholder = LightTheme().textPlaceholder;
          else
            textPlaceholder = DarkTheme().textPlaceholder;
          return Column(children: [
            Container(
                child: Text(child!, style: TextStyle(color: textPlaceholder)))
          ], mainAxisAlignment: MainAxisAlignment.center);
        },
        converter: (Store<StateStore> store) => store.state.theme);
  }
}
