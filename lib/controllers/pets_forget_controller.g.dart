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
  Future getListPetsForget() {
    return _$getListPetsForgetAsyncAction.run(() => super.getListPetsForget());
  }

  final _$getPetForgetByIdAsyncAction =
      AsyncAction('PetsForgetControllerStore.getPetForgetById');

  @override
  Future<void> getPetForgetById(String id, String uid) {
    return _$getPetForgetByIdAsyncAction
        .run(() => super.getPetForgetById(id, uid));
  }

  @override
  String toString() {
    return '''
listPetForget: ${listPetForget},
petForgetModel: ${petForgetModel}
    ''';
  }
}
