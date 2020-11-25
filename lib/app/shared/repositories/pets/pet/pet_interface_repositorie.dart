import 'dart:io';

import 'package:pets_manager/app/models/pets/pets_model.dart';

abstract class IPetRepositorie{
  Future<void> savePetCloud({String uid, PetsModel petsModel});
  Future<List<PetsModel>> getListPets({String uid});
  Future<void> updatePets({String uid, PetsModel petsModel});
  Future<Map<String, dynamic>> uploadImagePet({String uid, File imgFile});
}