import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:pets_manager/app/models/places/pet_places_model.dart';
import 'package:pets_manager/app/shared/location/location_interface_data.dart';
import 'package:pets_manager/app/shared/repositories/places/petplaces_repositorie.dart';

class PetPlacesController {
  final ILocationData geoData = Modular.get();
  Future<PetPlacesModel> getPetPlaces() async {
    List<dynamic> _listPetPlaces = await ListPetRepositorie.getListPetPlaces();
    LocationData _locationData = await geoData.getLocation();
    PetPlacesModel _petPlacesModel = PetPlacesModel.fromJson(_listPetPlaces,
        LatLng(_locationData.latitude, _locationData.longitude));
    return _petPlacesModel;
  }
}
