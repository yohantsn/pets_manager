import 'package:flutter/material.dart';
import 'package:pets_manager/models/pets/pets_model.dart';

class PetController{

  Future<List<PetsModel>> getListPet() async {
    List<PetsModel> _listPet = List<PetsModel>();
    PetsModel petsModel1 = PetsModel(
      idPet: "1",
      namePet: "Rex",
      speciePet: "Cão",
      dateNascPet: "23/04/2015",
      breedPet: "Pinscher",
      colorPet: "Preto",
      sex: "M",
      photoPet: "https://www.petz.com.br/cachorro/racas/pinscher/img/pinscher-caracteristicas-guia-racas.jpg");
    PetsModel petsModel2 = PetsModel(
        idPet: "2",
        namePet: "Meg",
        speciePet: "Gato",
        dateNascPet: "12/03/2017",
        breedPet: "SRD",
        colorPet: "Preto",
        sex: "F",
        photoPet: "https://www.telecao.pt/img/cms/Blog/gato-preto-4.jpg");
    _listPet.add(petsModel1);
    _listPet.add(petsModel2);
    return _listPet;
  }
}