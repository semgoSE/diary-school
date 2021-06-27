import 'package:diary_app/redux/redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FormItem extends StatelessWidget {

  String? top;
  String? bottom;
  Widget? child;

  FormItem({ this.top, this.bottom, this.child });


  @override
  Widget build(BuildContext context) {
    return(
      StoreConnector<StateStore, String>(builder: (context, theme) {
          return(
            Container(
              child: Column(children: [
                Container(child: Text(top!, style: TextStyle())),
                Container(child: child),
                Container(child: Text(bottom!, style: TextStyle()))
              ]),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      )
          );
      }, converter: (store) => store.state.theme)
    );
  }
  
}