//описываем состояние
import 'package:diary_app/redux/actions/AddLoginAndPasswordAndRegionSignUp.dart';
import 'package:diary_app/redux/actions/SetThemeAction.dart';
import 'package:diary_app/redux/actions/SignUpActions.dart';

class StateStore {
  SignUp signUp = SignUp();
  String theme = "light"; //light or dark
}

class SignUp {
  String? login;
  String? password;
  int? region_id;
  String? session;
}

//обрабатываем события
StateStore appReducers(StateStore state, dynamic action) {
  if (action is SignUpSetCookie) {
    //что-то делаем... вызаваем функцию для обработки и т.д
    return setCookie(state, action);
  } else if (action is SetThemeAction) {
    state.theme = action.theme;
    return state;
  } else if (action is AddLoginAndPasswordAndRegionSignUp) {
    state.signUp.login = action.login;
    state.signUp.password = action.password;
    state.signUp.region_id = action.region_id;
    return state;
  }
  return state;
}

StateStore setCookie(StateStore state, SignUpSetCookie action) {
  state.signUp.session = action.session;
  return state;
}

// List<CartItem> toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
//   return items.map((item) => item.name == action.item.name ?
//     action.item : item).toList();
// }
