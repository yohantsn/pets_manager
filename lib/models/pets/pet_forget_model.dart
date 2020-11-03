

class PetForgetModel {
  double lat;
  double lon;
  String uid;
  String mensagem;
  String idPet;

  PetForgetModel({ this.lat, this.lon, this.mensagem, this.uid, this.idPet});

  PetForgetModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    uid = json['uid'];
    idPet = json['idPet'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['mensagem'] = this.mensagem;
    data['uid'] = this.uid;
    data['idPet'] = this.idPet;
    return data;
  }
}
