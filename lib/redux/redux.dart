//описываем состояние
import 'package:diary_app/redux/actions/SetThemeAction.dart';
import 'package:diary_app/redux/actions/SignUpActions.dart';

class StateStore {
  SignUp signUp = SignUp();
  String theme = "dark"; //light or dark
}

class SignUp {
  String? cookie;
}

//обрабатываем события
StateStore appReducers(StateStore state, dynamic action) {
  if (action is SignUpSetCookie) {
    //что-то делаем... вызаваем функцию для обработки и т.д
    return setCookie(state, action);
  } else if (action is SetThemeAction) {
    state.theme = action.theme;
    return state;
  }
  return state;
}

StateStore setCookie(StateStore state, SignUpSetCookie action) {
  state.signUp.cookie = action.cookie;
  return state;
}

// List<CartItem> toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
//   return items.map((item) => item.name == action.item.name ?
//     action.item : item).toList();
// }
