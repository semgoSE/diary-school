import 'package:diary_app/components/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSpinner extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      child: ClipRRect(child: Container(child: Spinner(size: 60), color: Theme.of(context).backgroundColor, padding: EdgeInsets.all(16)), borderRadius: BorderRadius.circular(20)),
    );
  }
}