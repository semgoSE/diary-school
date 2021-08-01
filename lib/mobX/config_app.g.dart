// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Config on _Config, Store {
  final _$themeAtom = Atom(name: '_Config.theme');

  @override
  ThemeConfig get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeConfig value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$loginAtom = Atom(name: '_Config.login');

  @override
  bool get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(bool value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$_ConfigActionController = ActionController(name: '_Config');

  @override
  void setTheme(ThemeConfig theme) {
    final _$actionInfo =
        _$_ConfigActionController.startAction(name: '_Config.setTheme');
    try {
      return super.setTheme(theme);
    } finally {
      _$_ConfigActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin(bool _login) {
    final _$actionInfo =
        _$_ConfigActionController.startAction(name: '_Config.setLogin');
    try {
      return super.setLogin(_login);
    } finally {
      _$_ConfigActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
login: ${login}
    ''';
  }
}
