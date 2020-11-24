// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_lost_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetLostController on _PetLostController, Store {
  final _$userModelAtom = Atom(name: '_PetLostController.userModel');

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

  final _$petsModelAtom = Atom(name: '_PetLostController.petsModel');

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

  final _$isLoadingAtom = Atom(name: '_PetLostController.isLoading');

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

  final _$petFindAsyncAction = AsyncAction('_PetLostController.petFind');

  @override
  Future<void> petFind({BuildContext context}) {
    return _$petFindAsyncAction.run(() => super.petFind(context: context));
  }

  final _$_PetLostControllerActionController =
      ActionController(name: '_PetLostController');

  @override
  void petLost({BuildContext context}) {
    final _$actionInfo = _$_PetLostControllerActionController.startAction(
        name: '_PetLostController.petLost');
    try {
      return super.petLost(context: context);
    } finally {
      _$_PetLostControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
petsModel: ${petsModel},
isLoading: ${isLoading}
    ''';
  }
}
