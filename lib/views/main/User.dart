import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/redux/gv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User extends StatefulWidget {
  var store;

  User(this.store);
  @override
  State<StatefulWidget> createState() => UserState();
}

class UserState extends State<User> {
  var store;
  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.dispatch(ActionSetAppBar(AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Пользователь",
        style: TextStyle(color: Colors.black),
      ),
    )));
    return (ListView(
      children: [
        Expanded(
            child: Placeholder2(
          description: "Информация скоро появится.",
        ))
      ],
    ));
  }
}
