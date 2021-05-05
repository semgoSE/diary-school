import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:flutter/material.dart';

class SignUp_2 extends StatelessWidget {
  @override
  Widget build(Object context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: TitleLevel_1("#2 - Привязка"), flex: 1),
          Placeholder2(description: "ВОРООВрыовМРВМрмрывмоымв"),
          ListBody()
        ],
      ),
    ));
  }
}
