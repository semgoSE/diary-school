import 'package:diary_app/components/button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Icon(Icons.ac_unit_outlined, size: 128.0,)),
          Container(
            padding: EdgeInsets.only(bottom: 8.0),
            child: MyButton(
              child: Text("Вход", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              mode: "primary",
              disable: false,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8.0),
            child: MyButton(
              child: Text("Регистрация", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              mode: "secondary",
              disable: false,
              ),
          ),
        ],
      ),
    );
  }
}
