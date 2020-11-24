import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/pet/my_pet_forget/my_pet_forge_view.dart';
import 'package:pets_manager/app/modules/pet/pet_lost/pet_lost_view.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


part 'pet_general_controller.g.dart';

class PetGeneralController = _PetGeneralController with _$PetGeneralController;

abstract class _PetGeneralController with Store {
  _PetGeneralController({this.color_scheme, this.petsModel, this.userModel});

  @observable
  UserModel userModel;

  @observable
  PetsModel petsModel;

  @observable
  Color_Scheme color_scheme;

  @action
  void goToPetLost({BuildContext context}) {
    if (this.petsModel.isForget) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PetLostView(
                    petsModel: this.petsModel,
                    color_scheme: this.color_scheme,
                    userModel: this.userModel,
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyPetForgetView(
                  petsModel: this.petsModel,
                  color_scheme: this.color_scheme,
                  darkMode: this.userModel.ownerModeDark)));
    }
  }
}
