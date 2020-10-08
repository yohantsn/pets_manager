import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/location_manager.dart';
import 'package:pets_manager/models/pet_forget_model.dart';
import 'package:pets_manager/models/pets_model.dart';
import 'package:pets_manager/repositories/list_pets_forget.dart';
part 'my_pet_forget_controller.g.dart';

class MyPetForgetController = MyPetForgetControllerStore
    with _$MyPetForgetController;

abstract class MyPetForgetControllerStore with Store {
  MyPetForgetControllerStore() {
    getMyLocation();
  }

  @observable
  String addressClick = "";

  @observable
  LatLng latLngClick = LatLng(-25.4816272, -49.2856461);

  @observable
  PetForgetModel petForgetModel = PetForgetModel();

  @observable
  bool isLoading = false;

  @observable
  bool isSucess = false;

  @observable
  String messageError = "";

  @action
  void getMyLocation() {
    LocationManager().getLocation().then((value) {
      this.latLngClick = LatLng(value.latitude, value.longitude);
      getAddressClick(latLngClick);
    });
  }

  @action
  void getAddressClick(LatLng latLng) {
    this.latLngClick = latLng;
    Geocoder.local
        .findAddressesFromCoordinates(
            Coordinates(latLng.latitude, latLng.longitude))
        .then((value) {
      addressClick = value.first.addressLine;
      print("teste Address $addressClick");
    });
  }

  @action
  void savePetForget(PetsModel petsModel, String message) {
    this.isLoading = true;
    PetForgetModel petForgetModel = PetForgetModel(
        petsModel: petsModel,
        lat: this.latLngClick.latitude,
        lon: this.latLngClick.longitude,
        mensagem: message);
    Future.delayed(Duration(seconds: 3)).then((value){
      this.isLoading = false;
      this.isSucess = true;
    });
    //TODO - add to Firebase
  }
}
