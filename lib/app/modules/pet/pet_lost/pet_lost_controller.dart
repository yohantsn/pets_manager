import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/pet_forget_model.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/home/home_module/home_view.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet_repositories.dart';
import 'package:pets_manager/app/shared/repositories/pets/pets_forget_repositorie.dart';


part 'pet_lost_controller.g.dart';

class PetLostController = _PetLostController
    with _$PetLostController;

abstract class _PetLostController extends PetRepositories with Store {
  _PetLostController({this.userModel, this.petsModel});

  PetsForgetRepositorie petsForgetRepositorie = PetsForgetRepositorie();

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
    updatePets(petsModel: this.petsModel, uid: this.userModel.uid);
    PetForgetModel petForgetModel = await petsForgetRepositorie.getPetForgetByIdRepositorie(idPet: this.petsModel.idPet);
    petForgetModel.dateFind = DateTime.now().toUtc().toLocal();
    await PetsForgetRepositorie().updatePetFind(petForgetModel: petForgetModel);
    this.isLoading = false;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
  }

  @action
  void petLost({BuildContext context}){
    Navigator.pop(context);
  }
}
