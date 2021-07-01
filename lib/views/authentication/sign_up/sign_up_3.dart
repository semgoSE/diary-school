import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/input.dart';
import 'package:diary_app/components/select_mimicry.dart';
import 'package:diary_app/components/simple_cell.dart';
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
  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateStore,
        void Function(String login, String pass, int region_id)>(
      converter: (store) => (login, pass, region_id) => store.dispatch(
          AddLoginAndPasswordAndRegionSignUp(
              password: pass, login: login, region_id: region_id)),
      builder: (BuildContext context, addLoginAndPasswordAndRegionSignUp) {
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
                    child: "Добавить привязку",
                    before: Icon(Icons.add, color: ,),
                  ),
                  MyButton(
                    child: "Пропустить",
                    click: () => {},
                  ),
                ],
              ),
            ));
      },
    );
  }
}
