import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:pets_manager/core/location_manager.dart';
import 'package:pets_manager/models/pet_places_model.dart';
import 'package:pets_manager/repositories/petplaces_repositorie.dart';

class PetPlacesController {
  Future<PetPlacesModel> getPetPlaces() async {
    List<dynamic> _listPetPlaces = await ListPetRepositorie.getListPetPlaces();
    LocationData _locationdata = await LocationManager().getLocation();
    PetPlacesModel _petPlacesModel = PetPlacesModel.fromJson(_listPetPlaces,
        LatLng(_locationdata.latitude, _locationdata.longitude));
    return _petPlacesModel;
  }
}
