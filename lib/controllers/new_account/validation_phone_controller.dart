import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';

part 'validation_phone_controller.g.dart';

class ValidationPhoneController = _ValidationPhoneController with _$ValidationPhoneController;

abstract class _ValidationPhoneController with Store {

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


  @action
  Future<bool> verifyCode(String code) async{
    //TODO - add verify code with usermodel
    await Future.delayed(Duration(seconds: 5));
    return code == "1234";
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
  void validCode({BuildContext context}){
    String code = "$n1$n2$n3$n4";
    log(code);
    verifyCode(code).then((value) {
      if(value){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPetScreen()));
      }else{
        n1 = "";
        n2 = "";
        n3 = "";
        n4 = "";
        callSnackbar("Código digitado é inválido");
      }
    });

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