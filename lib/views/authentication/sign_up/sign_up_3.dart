import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/select_mimicry.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/models/AccountBind.dart';
import 'package:diary_app/redux/actions/AddLoginAndPasswordAndRegionSignUp.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:diary_app/views/authentication/sign_up/server_url_argement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignUp3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp3State();
}

class SignUp3State extends State<SignUp3> {

  List<AccountBind> accounts_bind = [];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateStore,dynamic>(
      converter: (store) => store,
      builder: (BuildContext context, store) {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
                title: Text("Привязка"),
                textTheme: Theme.of(context).textTheme),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text("Для удобства входа можете привязать различные соц.сети для доступа к аккаунту"),
                  ),
                  
                  SimpleCell(
                    child: Text("Добавить привязку"),
                    before: Icon(Icons.add),
                  ),
                  Expanded(child: ListView.builder(itemBuilder: (context, i) => SimpleCell(child: ))),
                   Container(child: MyButton(
                    mode: "commerce",
                    child: "Готов",
                    click: () => {},
                  ), padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16 )),
                ],
              ),
            ));
      },
    );
  }
}
