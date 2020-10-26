// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountController on _CreateAccountController, Store {
  final _$scaffoldKeyAtom = Atom(name: '_CreateAccountController.scaffoldKey');

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

  final _$formKeyAtom = Atom(name: '_CreateAccountController.formKey');

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
      Atom(name: '_CreateAccountController.controllerEmail');

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
      Atom(name: '_CreateAccountController.controllerPassword');

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

  final _$controllerConfPasswordAtom =
      Atom(name: '_CreateAccountController.controllerConfPassword');

  @override
  TextEditingController get controllerConfPassword {
    _$controllerConfPasswordAtom.reportRead();
    return super.controllerConfPassword;
  }

  @override
  set controllerConfPassword(TextEditingController value) {
    _$controllerConfPasswordAtom
        .reportWrite(value, super.controllerConfPassword, () {
      super.controllerConfPassword = value;
    });
  }

  final _$controllerNameAtom =
      Atom(name: '_CreateAccountController.controllerName');

  @override
  TextEditingController get controllerName {
    _$controllerNameAtom.reportRead();
    return super.controllerName;
  }

  @override
  set controllerName(TextEditingController value) {
    _$controllerNameAtom.reportWrite(value, super.controllerName, () {
      super.controllerName = value;
    });
  }

  final _$obscuredPassAtom =
      Atom(name: '_CreateAccountController.obscuredPass');

  @override
  bool get obscuredPass {
    _$obscuredPassAtom.reportRead();
    return super.obscuredPass;
  }

  @override
  set obscuredPass(bool value) {
    _$obscuredPassAtom.reportWrite(value, super.obscuredPass, () {
      super.obscuredPass = value;
    });
  }

  final _$obscuredConfPassAtom =
      Atom(name: '_CreateAccountController.obscuredConfPass');

  @override
  bool get obscuredConfPass {
    _$obscuredConfPassAtom.reportRead();
    return super.obscuredConfPass;
  }

  @override
  set obscuredConfPass(bool value) {
    _$obscuredConfPassAtom.reportWrite(value, super.obscuredConfPass, () {
      super.obscuredConfPass = value;
    });
  }

  final _$_CreateAccountControllerActionController =
      ActionController(name: '_CreateAccountController');

  @override
  void createAccount({BuildContext context}) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.createAccount');
    try {
      return super.createAccount(context: context);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showPassword() {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.showPassword');
    try {
      return super.showPassword();
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showConfPassword() {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.showConfPassword');
    try {
      return super.showConfPassword();
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void callSnackbar(String content) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.callSnackbar');
    try {
      return super.callSnackbar(content);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scaffoldKey: ${scaffoldKey},
formKey: ${formKey},
controllerEmail: ${controllerEmail},
controllerPassword: ${controllerPassword},
controllerConfPassword: ${controllerConfPassword},
controllerName: ${controllerName},
obscuredPass: ${obscuredPass},
obscuredConfPass: ${obscuredConfPass}
    ''';
  }
}
