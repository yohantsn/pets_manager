// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhoneNumberController on _PhoneNumerController, Store {
  final _$controllerAtom = Atom(name: '_PhoneNumerController.controller');

  @override
  MaskedTextController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(MaskedTextController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$scaffoldKeyAtom = Atom(name: '_PhoneNumerController.scaffoldKey');

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

  final _$formKeyAtom = Atom(name: '_PhoneNumerController.formKey');

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

  final _$_PhoneNumerControllerActionController =
      ActionController(name: '_PhoneNumerController');

  @override
  void saveNumberPhone({UserModel userModel, BuildContext context}) {
    final _$actionInfo = _$_PhoneNumerControllerActionController.startAction(
        name: '_PhoneNumerController.saveNumberPhone');
    try {
      return super.saveNumberPhone(userModel: userModel, context: context);
    } finally {
      _$_PhoneNumerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller},
scaffoldKey: ${scaffoldKey},
formKey: ${formKey}
    ''';
  }
}
