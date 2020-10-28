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

  Future<Map<String, dynamic>> uploadImagePet(String uid, File imgFile) async{
    Map<String, dynamic> result = Map<String, dynamic>();

      String nameImage = DateTime.now().toUtc().millisecondsSinceEpoch.toString();
      firebase_storage.UploadTask storage =  firebase_storage.FirebaseStorage.instance
          .ref('$uid/pets_profile/${nameImage}.jpg').putFile(imgFile);
    try {
      await storage;
      if(storage.snapshot.state == firebase_storage.TaskState.success) {
        result["urlPic"] = await storage.snapshot.ref.getDownloadURL();
      }
      return result;
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      result["error"] = "Tivemos um problema ao fazer o upload da imagem, por favor, tente novamente";
      return result;
    }

  }

  Future<List<PetsModel>> getListPets({String uid}) async{
    List<PetsModel> listPetsModel = List<PetsModel>();
    querySnapshot = await this
        .fire
        .collection("users_data")
        .doc(uid)
        .collection("pets")
        .get();

    querySnapshot.docs.forEach((element) {
      listPetsModel.add(PetsModel.fromJson(element.data()));
    });
    return listPetsModel;
  }
}