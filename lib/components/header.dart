import 'package:diary_app/mobX/config_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {

  final String header;

  Header({ required this.header });

  @override
  Widget build(BuildContext context) {
    Config config = Provider.of<Config>(context);
    return Observer(builder: (context) => Text(header, style: TextStyle(fontWeight: FontWeight.bold, color: config.customTheme.text_primary, fontSize: 14 ),));
  }
}
