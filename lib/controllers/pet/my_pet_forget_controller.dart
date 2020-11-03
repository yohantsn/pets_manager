import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/core/location_manager.dart';
import 'package:pets_manager/models/pets/pet_forget_model.dart';
import 'package:pets_manager/models/pets/pets_model.dart';
import 'package:pets_manager/repositories/pets/pet_repositories.dart';
import 'package:pets_manager/repositories/pets/pets_forget_repositorie.dart';
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
  MapboxMapController mapboxMapController;

  @observable
  LatLng latLngClick = LatLng(-25.4816272, -49.2856461);

  @observable
  TextEditingController txtController = TextEditingController();

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
  void onStyleLoaded() {
    this.mapboxMapController.addSymbol(
      SymbolOptions(
        geometry: this.latLngClick,
        iconImage: "assets/images/location_pin.png",
      ),
    );
  }

  @action
  void onMapCreated(MapboxMapController controller) {
    this.mapboxMapController = controller;
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
  void savePetForget(PetsModel petsModel, BuildContext context) {
    this.isLoading = true;
    String uid = AuthCore().getUid();
    petsModel.isForget = true;
    PetForgetModel petForgetModel = PetForgetModel(
        lat: this.latLngClick.latitude,
        lon: this.latLngClick.longitude,
        uid: uid,
        idPet: petsModel.idPet,
        mensagem: this.txtController.text ?? "");
    PetsForgetRepositorie().createPetForget(petForgetModel: petForgetModel).then((value) {
      PetRepositories().updatePets(uid: uid, petsModel: petsModel);
      this.isLoading = false;
      this.isSucess = true;
      Navigator.pop(context);
    });
  }
}
