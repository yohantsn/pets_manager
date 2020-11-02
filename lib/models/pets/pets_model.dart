import 'package:pets_manager/models/pets/vaccine_model.dart';

class PetsModel {
  String idPet;
  String namePet;
  String speciePet;
  String breedPet;
  String colorPet;
  String dateNascPet;
  String photoPet;
  String sex; //M - Macho F - Femea
  String microchip;
  List<VaccineModel> listVaccineModel;
  bool isForget;

  PetsModel(
      {this.idPet,
        this.namePet,
        this.speciePet,
        this.breedPet,
        this.colorPet,
        this.dateNascPet,
        this.photoPet,
        this.sex,
        this.microchip,
      this.isForget});

  PetsModel.fromJson(Map<String, dynamic> json) {
    idPet = json['idPet'];
    namePet = json['namePet'];
    speciePet = json['speciePet'];
    breedPet = json['breedPet'];
    colorPet = json['colorPet'];
    dateNascPet = json['dateNascPet'];
    photoPet = json['photoPet'];
    sex = json['sex'];
    microchip = json['microchip'];
    isForget = json['isForget'];
    if (json['listVaccineModel'] != null) {
      listVaccineModel = new List<VaccineModel>();
      json['listVaccineModel'].forEach((v) {
        listVaccineModel.add(new VaccineModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPet'] = this.idPet;
    data['namePet'] = this.namePet;
    data['speciePet'] = this.speciePet;
    data['breedPet'] = this.breedPet;
    data['colorPet'] = this.colorPet;
    data['dateNascPet'] = this.dateNascPet;
    data['photoPet'] = this.photoPet;
    data['sex'] = this.sex;
    data['microchip'] = this.microchip;
    data['isForget'] = this.isForget;
    if (this.listVaccineModel != null) {
      data['listVaccineModel'] = this.listVaccineModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}