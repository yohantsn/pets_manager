import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets_manager/models/pets/pet_forget_model.dart';
import 'package:pets_manager/models/pets/pets_model.dart';

class PetsForgetRepositorie{
  PetsForgetRepositorie(){
    this.fire = FirebaseFirestore.instance;
}
  FirebaseFirestore fire;
  QuerySnapshot querySnapshot;
  static Future<List<Map<String,dynamic>>> getListPetsForgetRepositorie() async{
    List<Map<String,dynamic>> _list = [
      {
        "petDetail" : {
          "idPet": "12",
          "namePet": "Bastet",
          "speciePet": "Gato",
          "agePet": "3 Anos",
          "breedPet": "SRD",
          "colorPet": "Preto",
          "sex": "F",
          "photoPet": "https://www.telecao.pt/img/cms/Blog/gato-preto-4.jpg",
          "microchip" : "1234450002"
        },
        "lat": -25.4266301,
        "lon": -49.2656127,
        "mensagem" : "Muito dócil, recompensa de 500 reais"
      },
      {
        "petDetail" : {
          "idPet": "12",
          "namePet": "Bastet",
          "speciePet": "Cão",
          "agePet": "5 Anos",
          "breedPet": "SRD",
          "colorPet": "Preto",
          "sex": "M",
          "photoPet": "https://www.telecao.pt/img/cms/Blog/gato-preto-4.jpg",
          "microchip" : "1234450002"
        },
        "lat": -25.4199011,
        "lon": -49.3031037,
        "mensagem" : "Muito dócil, recompensa de 500 reais"
      },
      {
        "petDetail" : {
          "idPet": "12",
          "namePet": "Jao",
          "speciePet": "Gato",
          "agePet": "3 Anos",
          "breedPet": "SRD",
          "colorPet": "Preto",
          "sex": "M",
          "photoPet": "https://www.telecao.pt/img/cms/Blog/gato-preto-4.jpg",
          "microchip" : "1234450002"
        },
        "lat": -25.4824861,
        "lon": -49.2719517,
        "mensagem" : "Muito dócil, recompensa de 500 reais"
      }
    ];
  }

  static Future<Map<String,dynamic>> getPetForgetByIdRepositorie(String id, String uid) async {
    Map<String, dynamic> _map;
    return _map;
  }

  Future<void> createPetForget({PetForgetModel petForgetModel, String uid}) async{
    await this
        .fire
        .collection("pets_forgets")
        .add(petForgetModel.toJson());
  }
}