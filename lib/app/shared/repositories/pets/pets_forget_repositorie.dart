import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets_manager/app/models/pets/pet_forget_model.dart';


class PetsForgetRepositorie{
  PetsForgetRepositorie(){
    this.fire = FirebaseFirestore.instance;
}
  FirebaseFirestore fire;


  Future<List<PetForgetModel>> getListPetsForgetRepositorie() async{
   QuerySnapshot _querySnapshot = await FirebaseFirestore.instance.collection("pets_lost").get();
   List<PetForgetModel> listPetForget = <PetForgetModel>[];
   for(QueryDocumentSnapshot item in _querySnapshot.docs){
     listPetForget.add(PetForgetModel.fromJson(item.data()));
   }
   return listPetForget;
  }

  Future<PetForgetModel> getPetForgetByIdRepositorie(
      {String idPet}) async {
   DocumentSnapshot docSnapshot =  await FirebaseFirestore.instance
       .collection("pets_lost")
       .doc(idPet)
       .get();
   PetForgetModel _petForget = PetForgetModel.fromJson(docSnapshot.data());
   return _petForget;
  }

  Future<void> updatePetFind({PetForgetModel petForgetModel}) async{
    await this
        .fire
        .collection("pets_find")
        .doc(petForgetModel.idPet)
        .set(petForgetModel.toJson());
    await this.fire.collection("pets_lost").doc(petForgetModel.idPet).delete();
  }

  Future<void> createPetForget({PetForgetModel petForgetModel}) async{
    try{
      await this.fire.collection("pets_lost").doc(petForgetModel.idPet).delete();
    }catch(e){
      log("Não existe pet_find para delete");
    }
    await this
        .fire
        .collection("pets_lost")
        .doc(petForgetModel.idPet)
        .set(petForgetModel.toJson());
  }

}