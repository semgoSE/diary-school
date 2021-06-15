//описываем состояние
import 'package:diary_app/redux/actions/SignUpActions.dart';

class State {
  SignUp signUp = SignUp();
}

class SignUp {
  String? cookie;
}

//обрабатываем события
State appReducers(State state, dynamic action) {
  if (action is SignUpSetCookie) {
    //что-то делаем... вызаваем функцию для обработки и т.д
    return setCookie(state, action);
  }
  return state;
}

State setCookie(State state, SignUpSetCookie action) {
  state.signUp.cookie = action.cookie;
  return state;
}

// List<CartItem> toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
//   return items.map((item) => item.name == action.item.name ?
//     action.item : item).toList();
// }
