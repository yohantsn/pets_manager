// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerStore, Store {
  final _$userModelAtom = Atom(name: 'HomeControllerStore.userModel');

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

  final _$color_SchemeAtom = Atom(name: 'HomeControllerStore.color_Scheme');

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

  final _$takePictureAsyncAction =
      AsyncAction('HomeControllerStore.takePicture');

  @override
  Future<void> takePicture() {
    return _$takePictureAsyncAction.run(() => super.takePicture());
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
color_Scheme: ${color_Scheme}
    ''';
  }
}
