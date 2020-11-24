// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$userModelAtom = Atom(name: '_HomeController.userModel');

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

  final _$color_SchemeAtom = Atom(name: '_HomeController.color_Scheme');

  @override
  Color_Scheme get color_Scheme {
    _$color_SchemeAtom.reportRead();
    return super.color_Scheme;
  }

  @override
  set color_Scheme(Color_Scheme value) {
    _$color_SchemeAtom.reportWrite(value, super.color_Scheme, () {
      super.color_Scheme = value;
    });
  }

  final _$listPetsModelsAtom = Atom(name: '_HomeController.listPetsModels');

  @override
  List<PetsModel> get listPetsModels {
    _$listPetsModelsAtom.reportRead();
    return super.listPetsModels;
  }

  @override
  set listPetsModels(List<PetsModel> value) {
    _$listPetsModelsAtom.reportWrite(value, super.listPetsModels, () {
      super.listPetsModels = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeController.isLoading');

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

  final _$takePictureAsyncAction = AsyncAction('_HomeController.takePicture');

  @override
  Future<void> takePicture() {
    return _$takePictureAsyncAction.run(() => super.takePicture());
  }

  final _$getListPetAsyncAction = AsyncAction('_HomeController.getListPet');

  @override
  Future<void> getListPet() {
    return _$getListPetAsyncAction.run(() => super.getListPet());
  }

  final _$getUserDataAsyncAction = AsyncAction('_HomeController.getUserData');

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
color_Scheme: ${color_Scheme},
listPetsModels: ${listPetsModels},
isLoading: ${isLoading}
    ''';
  }
}
