import 'package:pets_manager/models/pet_forget_model.dart';
import 'package:pets_manager/repositories/list_pets_forget.dart';

class PetsForgetController{

  Future<List<PetForgetModel>> getListPetsForget() async{
    List<Map<String,dynamic>> _list = await ListPetsForget.getListPetsForgetRepositorie();
    List<PetForgetModel> _listPetsForget = List<PetForgetModel>();
    _list.forEach((element) {
      PetForgetModel _petForgetModel = PetForgetModel.fromJson(element);
      _listPetsForget.add(_petForgetModel);
    });
    return _listPetsForget;
  }

  Future<PetForgetModel> getPetForgetById(String id, String uid) async{
    Map<String,dynamic> _map = await ListPetsForget.getPetForgetByIdRepositorie(id, uid);
    if(_map.isNotEmpty && _map != null){
      return PetForgetModel.fromJson(_map);
    }
  }
}