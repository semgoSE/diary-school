// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUp on _SignUp, Store {
  final _$loginAtom = Atom(name: '_SignUp.login');

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUp.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$region_idAtom = Atom(name: '_SignUp.region_id');

  @override
  int get region_id {
    _$region_idAtom.reportRead();
    return super.region_id;
  }

  @override
  set region_id(int value) {
    _$region_idAtom.reportWrite(value, super.region_id, () {
      super.region_id = value;
    });
  }

  final _$sessionAtom = Atom(name: '_SignUp.session');

  @override
  String get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(String value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
  }

  final _$_SignUpActionController = ActionController(name: '_SignUp');

  @override
  void setSignUp1(String _login, String _pass, int _region_id) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setSignUp1');
    try {
      return super.setSignUp1(_login, _pass, _region_id);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin(String _login) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setLogin');
    try {
      return super.setLogin(_login);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String _pass) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setPassword');
    try {
      return super.setPassword(_pass);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUrl(int _region_id) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setUrl');
    try {
      return super.setUrl(_region_id);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSession(String _session) {
    final _$actionInfo =
        _$_SignUpActionController.startAction(name: '_SignUp.setSession');
    try {
      return super.setSession(_session);
    } finally {
      _$_SignUpActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
region_id: ${region_id},
session: ${session}
    ''';
  }
}
