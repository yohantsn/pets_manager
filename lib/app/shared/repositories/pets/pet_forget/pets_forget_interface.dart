import 'package:pets_manager/app/models/pets/pet_forget_model.dart';

abstract class IPetForget{
  Future<List<PetForgetModel>> getListPetsForgetRepositorie();
  Future<PetForgetModel> getPetForgetByIdRepositorie({String idPet});
  Future<void> updatePetFind({PetForgetModel petForgetModel});
  Future<void> createPetForget({PetForgetModel petForgetModel});
}