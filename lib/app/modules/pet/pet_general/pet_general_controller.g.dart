// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_general_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetGeneralController on _PetGeneralController, Store {
  final _$userModelAtom = Atom(name: '_PetGeneralController.userModel');

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

  final _$petsModelAtom = Atom(name: '_PetGeneralController.petsModel');

  @override
  PetsModel get petsModel {
    _$petsModelAtom.reportRead();
    return super.petsModel;
  }

  @override
  set petsModel(PetsModel value) {
    _$petsModelAtom.reportWrite(value, super.petsModel, () {
      super.petsModel = value;
    });
  }

  final _$color_schemeAtom = Atom(name: '_PetGeneralController.color_scheme');

  @override
  Color_Scheme get color_scheme {
    _$color_schemeAtom.reportRead();
    return super.color_scheme;
  }

  @override
  set color_scheme(Color_Scheme value) {
    _$color_schemeAtom.reportWrite(value, super.color_scheme, () {
      super.color_scheme = value;
    });
  }

  final _$_PetGeneralControllerActionController =
      ActionController(name: '_PetGeneralController');

  @override
  void goToPetLost({BuildContext context}) {
    final _$actionInfo = _$_PetGeneralControllerActionController.startAction(
        name: '_PetGeneralController.goToPetLost');
    try {
      return super.goToPetLost(context: context);
    } finally {
      _$_PetGeneralControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
petsModel: ${petsModel},
color_scheme: ${color_scheme}
    ''';
  }
}
