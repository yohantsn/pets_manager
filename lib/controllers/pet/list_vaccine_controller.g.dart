// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_vaccine_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListVaccineController on ListVaccineControllerStore, Store {
  final _$isLoadingAtom = Atom(name: 'ListVaccineControllerStore.isLoading');

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

  final _$petsModelAtom = Atom(name: 'ListVaccineControllerStore.petsModel');

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

  final _$listVaccineModelAtom =
      Atom(name: 'ListVaccineControllerStore.listVaccineModel');

  @override
  List<VaccineModel> get listVaccineModel {
    _$listVaccineModelAtom.reportRead();
    return super.listVaccineModel;
  }

  @override
  set listVaccineModel(List<VaccineModel> value) {
    _$listVaccineModelAtom.reportWrite(value, super.listVaccineModel, () {
      super.listVaccineModel = value;
    });
  }

  final _$ListVaccineControllerStoreActionController =
      ActionController(name: 'ListVaccineControllerStore');

  @override
  void getListVaccine() {
    final _$actionInfo = _$ListVaccineControllerStoreActionController
        .startAction(name: 'ListVaccineControllerStore.getListVaccine');
    try {
      return super.getListVaccine();
    } finally {
      _$ListVaccineControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
petsModel: ${petsModel},
listVaccineModel: ${listVaccineModel}
    ''';
  }
}
