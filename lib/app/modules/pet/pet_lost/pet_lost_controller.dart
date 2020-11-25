import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/pet_forget_model.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/home/home_module/home_view.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_interface_repositorie.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet_forget/pets_forget_interface.dart';


part 'pet_lost_controller.g.dart';

class PetLostController = _PetLostController
    with _$PetLostController;

abstract class _PetLostController with Store {
  final IPetRepositorie petRepositorie = Modular.get();
  final IPetForget petForget = Modular.get();
  _PetLostController({this.userModel, this.petsModel});

  @observable
  UserModel userModel;

  @observable
  PetsModel petsModel;

  @observable
  bool isLoading = false;

  @action
  Future<void> petFind({BuildContext context}) async {
    this.isLoading = true;
    this.petsModel.isForget = false;
    petRepositorie.updatePets(petsModel: this.petsModel, uid: this.userModel.uid);
    PetForgetModel petForgetModel = await petForget.getPetForgetByIdRepositorie(idPet: this.petsModel.idPet);
    petForgetModel.dateFind = DateTime.now().toUtc().toLocal();
    await petForget.updatePetFind(petForgetModel: petForgetModel);
    this.isLoading = false;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
  }

  @action
  void petLost({BuildContext context}){
    Navigator.pop(context);
  }
}
