import 'package:flutter/material.dart';

class StateAppStore {
  AppBar appBar;
  var diary;
  StateAppStore({this.appBar, this.diary});
}

class ActionSetAppBar {
  final AppBar appBar;

  ActionSetAppBar(this.appBar);
}

class ActionSetDiary {
  var diary;

  ActionSetDiary(this.diary);
}

StateAppStore appReducers(StateAppStore item, dynamic action) {
  if (action is ActionSetAppBar) {
    return addItem(item, action);
  } else {
    if (action is ActionSetDiary) {
      return setDiary(item, action);
    }
  }
  return item;
}

StateAppStore setDiary(StateAppStore item, ActionSetDiary action) {
  item.diary = action.diary;
}

StateAppStore addItem(StateAppStore item, ActionSetAppBar action) {
  item.appBar = action.appBar;
  return item;
}
