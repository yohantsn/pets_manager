// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_phone_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ValidationPhoneController on _ValidationPhoneController, Store {
  final _$scaffoldKeyAtom =
      Atom(name: '_ValidationPhoneController.scaffoldKey');

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

  final _$isLoadingAtom = Atom(name: '_ValidationPhoneController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isValidAtom = Atom(name: '_ValidationPhoneController.isValid');

  @override
  bool get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(bool value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  final _$n1Atom = Atom(name: '_ValidationPhoneController.n1');

  @override
  String get n1 {
    _$n1Atom.reportRead();
    return super.n1;
  }

  @override
  set n1(String value) {
    _$n1Atom.reportWrite(value, super.n1, () {
      super.n1 = value;
    });
  }

  final _$n2Atom = Atom(name: '_ValidationPhoneController.n2');

  @override
  String get n2 {
    _$n2Atom.reportRead();
    return super.n2;
  }

  @override
  set n2(String value) {
    _$n2Atom.reportWrite(value, super.n2, () {
      super.n2 = value;
    });
  }

  final _$n3Atom = Atom(name: '_ValidationPhoneController.n3');

  @override
  String get n3 {
    _$n3Atom.reportRead();
    return super.n3;
  }

  @override
  set n3(String value) {
    _$n3Atom.reportWrite(value, super.n3, () {
      super.n3 = value;
    });
  }

  final _$n4Atom = Atom(name: '_ValidationPhoneController.n4');

  @override
  String get n4 {
    _$n4Atom.reportRead();
    return super.n4;
  }

  @override
  set n4(String value) {
    _$n4Atom.reportWrite(value, super.n4, () {
      super.n4 = value;
    });
  }

  final _$userModelAtom = Atom(name: '_ValidationPhoneController.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$uidAtom = Atom(name: '_ValidationPhoneController.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$verifyCodeAsyncAction =
      AsyncAction('_ValidationPhoneController.verifyCode');

  @override
  Future<bool> verifyCode(String code) {
    return _$verifyCodeAsyncAction.run(() => super.verifyCode(code));
  }

  final _$validCodeAsyncAction =
      AsyncAction('_ValidationPhoneController.validCode');

  @override
  Future<void> validCode({BuildContext context}) {
    return _$validCodeAsyncAction.run(() => super.validCode(context: context));
  }

  final _$_ValidationPhoneControllerActionController =
      ActionController(name: '_ValidationPhoneController');

  @override
  void preencheCode(String _nDigit, {BuildContext context}) {
    final _$actionInfo = _$_ValidationPhoneControllerActionController
        .startAction(name: '_ValidationPhoneController.preencheCode');
    try {
      return super.preencheCode(_nDigit, context: context);
    } finally {
      _$_ValidationPhoneControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNumber() {
    final _$actionInfo = _$_ValidationPhoneControllerActionController
        .startAction(name: '_ValidationPhoneController.deleteNumber');
    try {
      return super.deleteNumber();
    } finally {
      _$_ValidationPhoneControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void callSnackbar(String content) {
    final _$actionInfo = _$_ValidationPhoneControllerActionController
        .startAction(name: '_ValidationPhoneController.callSnackbar');
    try {
      return super.callSnackbar(content);
    } finally {
      _$_ValidationPhoneControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scaffoldKey: ${scaffoldKey},
isLoading: ${isLoading},
isValid: ${isValid},
n1: ${n1},
n2: ${n2},
n3: ${n3},
n4: ${n4},
userModel: ${userModel},
uid: ${uid}
    ''';
  }
}
