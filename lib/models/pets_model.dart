class PetsModel {
  String idPet;
  String namePet;
  String speciePet;
  String breedPet;
  String colorPet;
  String agePet;
  String photoPet;
  String sex; //M - Macho F - Femea
  String microchip;

  PetsModel(
      {this.idPet,
        this.namePet,
        this.speciePet,
        this.breedPet,
        this.colorPet,
        this.agePet,
        this.photoPet,
        this.sex,
        this.microchip});

  PetsModel.fromJson(Map<String, dynamic> json) {
    idPet = json['idPet'];
    namePet = json['namePet'];
    speciePet = json['speciePet'];
    breedPet = json['breedPet'];
    colorPet = json['colorPet'];
    agePet = json['agePet'];
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
    data['agePet'] = this.agePet;
    data['photoPet'] = this.photoPet;
    data['sex'] = this.sex;
    data['microchip'] = this.microchip;
    return data;
  }
}