import 'package:pets_manager/models/pets/pets_model.dart';

class PetForgetModel {
  PetsModel petsModel;
  double lat;
  double lon;
  String mensagem;

  PetForgetModel({this.petsModel, this.lat, this.lon, this.mensagem});

  PetForgetModel.fromJson(Map<String, dynamic> json) {
    petsModel = json['petDetail'] != null
        ? new PetsModel.fromJson(json['petDetail'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.petsModel != null) {
      data['petDetail'] = this.petsModel.toJson();
    }
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['mensagem'] = this.mensagem;
    return data;
  }
}
