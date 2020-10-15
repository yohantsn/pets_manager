// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_health_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListHealthController on _ListHealthControllerStore, Store {
  final _$listHealthModelAtom =
      Atom(name: '_ListHealthControllerStore.listHealthModel');

  @override
  List<HealthModel> get listHealthModel {
    _$listHealthModelAtom.reportRead();
    return super.listHealthModel;
  }

  @override
  set listHealthModel(List<HealthModel> value) {
    _$listHealthModelAtom.reportWrite(value, super.listHealthModel, () {
      super.listHealthModel = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ListHealthControllerStore.isLoading');

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

  final _$_ListHealthControllerStoreActionController =
      ActionController(name: '_ListHealthControllerStore');

  @override
  void getListHealth() {
    final _$actionInfo = _$_ListHealthControllerStoreActionController
        .startAction(name: '_ListHealthControllerStore.getListHealth');
    try {
      return super.getListHealth();
    } finally {
      _$_ListHealthControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listHealthModel: ${listHealthModel},
isLoading: ${isLoading}
    ''';
  }
}
