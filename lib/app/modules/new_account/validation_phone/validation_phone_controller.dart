import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/pet/cadastro_pet/cadastro_pet_view.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_interface.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositorie_interface.dart';

part 'validation_phone_controller.g.dart';

class ValidationPhoneController = _ValidationPhoneController with _$ValidationPhoneController;

abstract class _ValidationPhoneController with Store {

  _ValidationPhoneController({this.userModel});

  final IUser userFirebase = Modular.get();
  final IAuth authFirebase = Modular.get();

  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  bool isLoading = false;

  @observable
  bool isValid = false;

  @observable
  String n1 = "";

  @observable
  String n2 = "";

  @observable
  String n3 = "";

  @observable
  String n4 = "";

  @observable
  UserModel userModel;

  @observable
  String uid = "";

  @action
  Future<bool> verifyCode(String code) async {
    if(this.userModel.codeValidation == null || this.userModel.codeValidation.isEmpty){
      this.uid = authFirebase.getUid();
      this.userModel = await userFirebase.getUserModel(uid: uid);
    }
    return code == this.userModel.codeValidation;
  }

  @action
  void preencheCode(String _nDigit, {BuildContext context}) {
    if(n1.isEmpty){
        n1 = _nDigit;
      return;
    }
    if(n2.isEmpty){
      n2 = _nDigit;
      return;
    }
    if(n3.isEmpty){
      n3 = _nDigit;
      return;
    }
    if(n4.isEmpty){
      n4 = _nDigit;
      isLoading = true;
      validCode(context: context);
      return;
    }
  }

  @action
  void deleteNumber(){
    if(n4.isNotEmpty){
      n4 = "";
      return;
    }
    if(n3.isNotEmpty){
      n3 = "";
      return;
    }
    if(n2.isNotEmpty){
      n2 = "";
      return;
    }
    if(n1.isNotEmpty){
      n1 = "";
      return;
    }
  }

  @action
  Future<void> validCode({BuildContext context}) async {
    String code = "$n1$n2$n3$n4";
    log(code);
    bool value = await verifyCode(code);
    if(value){
      this.userModel.isPhoneVerified = true;
      await userFirebase.updateProfile(uid: this.userModel.uid, userModel: this.userModel);
      Navigator.push(context, MaterialPageRoute(builder: (context) => NewPetScreen(userModel: this.userModel,)));
    }else{
      n1 = "";
      n2 = "";
      n3 = "";
      n4 = "";
      callSnackbar("Código digitado é inválido");
    }
  }

  @action
  void callSnackbar(String content) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(content, style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
    return;
  }
}