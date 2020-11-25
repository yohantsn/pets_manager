// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerStore, Store {
  final _$scaffoldKeyAtom = Atom(name: '_LoginControllerStore.scaffoldKey');

  @override
  GlobalKey<ScaffoldState> get scaffoldKey {
    _$scaffoldKeyAtom.reportRead();
    return super.scaffoldKey;
  }

  @override
  set scaffoldKey(GlobalKey<ScaffoldState> value) {
    _$scaffoldKeyAtom.reportWrite(value, super.scaffoldKey, () {
      super.scaffoldKey = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_LoginControllerStore.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$controllerEmailAtom =
      Atom(name: '_LoginControllerStore.controllerEmail');

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  final _$controllerPasswordAtom =
      Atom(name: '_LoginControllerStore.controllerPassword');

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  final _$_LoginControllerStoreActionController =
      ActionController(name: '_LoginControllerStore');

  @override
  void signIn() {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.signIn');
    try {
      return super.signIn();
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void callSnackbar(String content) {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.callSnackbar');
    try {
      return super.callSnackbar(content);
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scaffoldKey: ${scaffoldKey},
formKey: ${formKey},
controllerEmail: ${controllerEmail},
controllerPassword: ${controllerPassword}
    ''';
  }
}
