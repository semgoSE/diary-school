import 'package:flutter/widgets.dart';

class TitleLevel_1 extends StatelessWidget {
  final String text;
  TitleLevel_1(this.text);

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.center,
      child: Text(text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
    ));
  }
}
