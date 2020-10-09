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

  PetsModel(
      {this.idPet,
        this.namePet,
        this.speciePet,
        this.breedPet,
        this.colorPet,
        this.dateNascPet,
        this.photoPet,
        this.sex,
        this.microchip});

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
    return data;
  }
}