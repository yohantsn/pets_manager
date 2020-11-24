// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_pet_forget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyPetForgetController on _MyPetForgetController, Store {
  final _$addressClickAtom = Atom(name: '_MyPetForgetController.addressClick');

  @override
  String get addressClick {
    _$addressClickAtom.reportRead();
    return super.addressClick;
  }

  @override
  set addressClick(String value) {
    _$addressClickAtom.reportWrite(value, super.addressClick, () {
      super.addressClick = value;
    });
  }

  final _$mapboxMapControllerAtom =
      Atom(name: '_MyPetForgetController.mapboxMapController');

  @override
  MapboxMapController get mapboxMapController {
    _$mapboxMapControllerAtom.reportRead();
    return super.mapboxMapController;
  }

  @override
  set mapboxMapController(MapboxMapController value) {
    _$mapboxMapControllerAtom.reportWrite(value, super.mapboxMapController, () {
      super.mapboxMapController = value;
    });
  }

  final _$latLngClickAtom = Atom(name: '_MyPetForgetController.latLngClick');

  @override
  LatLng get latLngClick {
    _$latLngClickAtom.reportRead();
    return super.latLngClick;
  }

  @override
  set latLngClick(LatLng value) {
    _$latLngClickAtom.reportWrite(value, super.latLngClick, () {
      super.latLngClick = value;
    });
  }

  final _$txtControllerAtom =
      Atom(name: '_MyPetForgetController.txtController');

  @override
  TextEditingController get txtController {
    _$txtControllerAtom.reportRead();
    return super.txtController;
  }

  @override
  set txtController(TextEditingController value) {
    _$txtControllerAtom.reportWrite(value, super.txtController, () {
      super.txtController = value;
    });
  }

  final _$petForgetModelAtom =
      Atom(name: '_MyPetForgetController.petForgetModel');

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

  final _$isLoadingAtom = Atom(name: '_MyPetForgetController.isLoading');

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

  final _$isSucessAtom = Atom(name: '_MyPetForgetController.isSucess');

  @override
  bool get isSucess {
    _$isSucessAtom.reportRead();
    return super.isSucess;
  }

  @override
  set isSucess(bool value) {
    _$isSucessAtom.reportWrite(value, super.isSucess, () {
      super.isSucess = value;
    });
  }

  final _$messageErrorAtom = Atom(name: '_MyPetForgetController.messageError');

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  final _$_MyPetForgetControllerActionController =
      ActionController(name: '_MyPetForgetController');

  @override
  void getMyLocation() {
    final _$actionInfo = _$_MyPetForgetControllerActionController.startAction(
        name: '_MyPetForgetController.getMyLocation');
    try {
      return super.getMyLocation();
    } finally {
      _$_MyPetForgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onStyleLoaded() {
    final _$actionInfo = _$_MyPetForgetControllerActionController.startAction(
        name: '_MyPetForgetController.onStyleLoaded');
    try {
      return super.onStyleLoaded();
    } finally {
      _$_MyPetForgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onMapCreated(MapboxMapController controller) {
    final _$actionInfo = _$_MyPetForgetControllerActionController.startAction(
        name: '_MyPetForgetController.onMapCreated');
    try {
      return super.onMapCreated(controller);
    } finally {
      _$_MyPetForgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAddressClick(LatLng latLng) {
    final _$actionInfo = _$_MyPetForgetControllerActionController.startAction(
        name: '_MyPetForgetController.getAddressClick');
    try {
      return super.getAddressClick(latLng);
    } finally {
      _$_MyPetForgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePetForget(PetsModel petsModel, BuildContext context) {
    final _$actionInfo = _$_MyPetForgetControllerActionController.startAction(
        name: '_MyPetForgetController.savePetForget');
    try {
      return super.savePetForget(petsModel, context);
    } finally {
      _$_MyPetForgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToHome({BuildContext context}) {
    final _$actionInfo = _$_MyPetForgetControllerActionController.startAction(
        name: '_MyPetForgetController.goToHome');
    try {
      return super.goToHome(context: context);
    } finally {
      _$_MyPetForgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addressClick: ${addressClick},
mapboxMapController: ${mapboxMapController},
latLngClick: ${latLngClick},
txtController: ${txtController},
petForgetModel: ${petForgetModel},
isLoading: ${isLoading},
isSucess: ${isSucess},
messageError: ${messageError}
    ''';
  }
}
