import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/pets/vaccine_model.dart';
import 'package:pets_manager/app/shared/repositories/pets/vaccine/vaccine_repositorie.dart';
part 'list_vaccine_controller.g.dart';

class ListVaccineController = _ListVaccineControllerStore
    with _$ListVaccineController;

abstract class _ListVaccineControllerStore with Store {

  _ListVaccineControllerStore({@required PetsModel pets}){
    this.petsModel = pets;
    getListVaccine();
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
      isLoading = false;
    });
  }
}