import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/models/pets_model.dart';
import 'package:pets_manager/models/vaccine_model.dart';
import 'package:pets_manager/repositories/vaccine_repositorie.dart';

part 'list_vaccine_controller.g.dart';

class ListVaccineController = ListVaccineControllerStore
    with _$ListVaccineController;

abstract class ListVaccineControllerStore with Store {

  ListVaccineControllerStore({@required PetsModel pets}){
    this.petsModel = pets;
  }

  VaccineRepositorie _vaccineRepositorie = VaccineRepositorie();

  @observable
  bool isLoading = false;

  @observable
  PetsModel petsModel = PetsModel();

  @observable
  List<VaccineModel> listVaccineModel = List<VaccineModel>();

  @action
  void getListVaccine(){
    isLoading = true;
    _vaccineRepositorie.getListVaccine(idPet: this.petsModel.idPet).then((value){
      this.listVaccineModel = value;
      print(value);
      isLoading = false;
    });
  }
}