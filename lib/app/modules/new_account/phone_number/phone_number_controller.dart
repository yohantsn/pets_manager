import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/new_account/validation_phone/validation_phone_view.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositorie_interface.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositories_firebase.dart';

part 'phone_number_controller.g.dart';

class PhoneNumberController = _PhoneNumerController with _$PhoneNumberController;

abstract class _PhoneNumerController with Store {
  final IUser userFirebase = Modular.get();
  @observable
  var controller = new MaskedTextController(mask: '(00)00000-0000');

  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @action
  void saveNumberPhone({UserModel userModel, BuildContext context}){
    if(formKey.currentState.validate()){
      userModel.ownerPhone = controller.text;
      var rng = new Random();
      String code = rng.nextInt(4).toString();
      if(code.length < 4){
        if(code.length == 1){
          code = "000$code";
        }else if(code.length == 2){
          code = "00$code";
        }else if(code.length == 1){
          code = "0$code";
        }
      }
      userModel.codeValidation = code;
      userFirebase.updateProfile(uid: userModel.uid, userModel: userModel).then((value){
        //TODO - add API SMS
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ValidationPhoneView(
                  userModel: userModel,
                )));
      });
    }
  }
}