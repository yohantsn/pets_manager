// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_forget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetsForgetController on PetsForgetControllerStore, Store {
  final _$listPetForgetAtom =
      Atom(name: 'PetsForgetControllerStore.listPetForget');

  @override
  List<PetForgetModel> get listPetForget {
    _$listPetForgetAtom.reportRead();
    return super.listPetForget;
  }

  @override
  set listPetForget(List<PetForgetModel> value) {
    _$listPetForgetAtom.reportWrite(value, super.listPetForget, () {
      super.listPetForget = value;
    });
  }

  final _$petForgetModelAtom =
      Atom(name: 'PetsForgetControllerStore.petForgetModel');

  @override
  PetForgetModel get petForgetModel {
    _$petForgetModelAtom.reportRead();
    return super.petForgetModel;
  }

  @override
  set petForgetModel(PetForgetModel value) {
    _$petForgetModelAtom.reportWrite(value, super.petForgetModel, () {
      super.petForgetModel = value;
    });
  }

  final _$getListPetsForgetAsyncAction =
      AsyncAction('PetsForgetControllerStore.getListPetsForget');

  @override
  Future<void> getListPetsForget() {
    return _$getListPetsForgetAsyncAction.run(() => super.getListPetsForget());
  }

  final _$PetsForgetControllerStoreActionController =
      ActionController(name: 'PetsForgetControllerStore');

  @override
  void getPetForgetById(String id, String uid) {
    final _$actionInfo = _$PetsForgetControllerStoreActionController
        .startAction(name: 'PetsForgetControllerStore.getPetForgetById');
    try {
      return super.getPetForgetById(id, uid);
    } finally {
      _$PetsForgetControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPetForget: ${listPetForget},
petForgetModel: ${petForgetModel}
    ''';
  }
}
