import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pets_manager/models/pets/pets_model.dart';

class PetRepositories{
  PetRepositories(){
    this.fire = FirebaseFirestore.instance;
    storage = firebase_storage.FirebaseStorage.instance;
  }

  FirebaseFirestore fire;
  QuerySnapshot querySnapshot;
  firebase_storage.FirebaseStorage storage;

  Future<void> savePetCloud({String uid, PetsModel petsModel}) async{
    await this
        .fire
        .collection("users_data")
        .doc(uid)
        .collection("pets")
        .add(petsModel.toJson());
  }

  Future<Map<String, dynamic>> updateImagePet(String uid, File imgFile) async{
    Map<String, dynamic> result;

    try {
      firebase_storage.TaskSnapshot task = await firebase_storage.FirebaseStorage.instance
          .ref('$uid/pets_profile/')
          .putFile(imgFile);
      result["urlPic"] = await task.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      result["error"] = "Tivemos um problema ao fazer o upload da imagem, por favor, tente novamente";
    }
    return result;
  }
}