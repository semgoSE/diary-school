import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalPanelHeader extends StatelessWidget with ObstructingPreferredSizeWidget {

  AppBar appBar;
  ModalPanelHeader({ required this.appBar });

  @override
  Widget build(BuildContext context) {
    return appBar;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }

}
