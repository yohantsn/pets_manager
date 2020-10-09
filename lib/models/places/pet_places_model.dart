import 'package:latlong/latlong.dart';
import 'package:pets_manager/models/places/petshop_model.dart';
import 'package:pets_manager/models/places/veterinary_model.dart';


class PetPlacesModel{
  List<PetShopModel> listPetShops = List<PetShopModel>();
  List<VeterinaryModel> listVeterinary = List<VeterinaryModel>();

  PetPlacesModel.fromJson(List<Map<String,dynamic>> json, LatLng _latlng){
    json.forEach((value) {
        List<dynamic> _list = value["type"];
        _list.forEach((element) {
          switch (element) {
            case 1:
              listVeterinary.add(new VeterinaryModel.fromJson(value, _latlng));
              break;
            case 2:
              try {
                listPetShops.add(new PetShopModel.fromJson(value, _latlng));
              }catch(e){
                print(e);
              }
              break;
          }
        });
    });
    if(listPetShops.length > 1) {
      listPetShops.sort((a, b) {
        return a.distance.compareTo(b.distance);
      });
    }
    if(listVeterinary.length > 1) {
      listVeterinary.sort((a, b) {
        return a.distance.compareTo(b.distance);
      });
    }
  }
}