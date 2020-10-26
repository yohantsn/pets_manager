import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/repositories/user/user_repositories.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';

part 'validation_phone_controller.g.dart';

class ValidationPhoneController = _ValidationPhoneController with _$ValidationPhoneController;

abstract class _ValidationPhoneController with Store {

  _ValidationPhoneController({this.userModel});

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
      this.uid = AuthCore().getUid();
      this.userModel = await UserRepositories().getUserModel(uid: uid);
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
      await UserRepositories().updateProfile(uid: this.userModel.uid, userModel: this.userModel);
      Navigator.push(context, MaterialPageRoute(builder: (context) => NewPetScreen()));
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