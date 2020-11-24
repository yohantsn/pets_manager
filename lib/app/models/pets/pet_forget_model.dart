

class PetForgetModel {
  double lat;
  double lon;
  String uid;
  String mensagem;
  String idPet;
  DateTime dateLost;
  DateTime dateFind;

  PetForgetModel({ this.lat, this.lon, this.mensagem, this.uid, this.idPet, this.dateFind, this.dateLost});

  PetForgetModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    uid = json['uid'];
    idPet = json['idPet'];
    mensagem = json['mensagem'];
    dateFind = json['dateFind'];
    dateLost = json['dateLost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['mensagem'] = this.mensagem;
    data['uid'] = this.uid;
    data['idPet'] = this.idPet;
    data['dateLost'] = this.dateLost;
    data['dateFind'] = this.dateFind;
    return data;
  }
}
