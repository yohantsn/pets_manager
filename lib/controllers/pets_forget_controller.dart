import 'package:mobx/mobx.dart';
import 'package:pets_manager/models/pet_forget_model.dart';
import 'package:pets_manager/repositories/list_pets_forget.dart';
part 'pets_forget_controller.g.dart';

class PetsForgetController = PetsForgetControllerStore with _$PetsForgetController;

abstract class PetsForgetControllerStore with Store{

  @observable
  List<PetForgetModel> listPetForget = List<PetForgetModel>();

  @observable
  PetForgetModel petForgetModel = PetForgetModel();

  @action
  void getListPetsForget() async{
    List<Map<String,dynamic>> _list = await ListPetsForget.getListPetsForgetRepositorie();
    List<PetForgetModel> _listPetsForget = List<PetForgetModel>();
    _list.forEach((element) {
      PetForgetModel _petForgetModel = PetForgetModel.fromJson(element);
      _listPetsForget.add(_petForgetModel);
    });
    this.listPetForget = _listPetsForget;
  }

  @action
  Future<void> getPetForgetById(String id, String uid) async{
    Map<String,dynamic> _map = await ListPetsForget.getPetForgetByIdRepositorie(id, uid);
    if(_map.isNotEmpty && _map != null){
      this.petForgetModel = PetForgetModel.fromJson(_map);
    }
  }
}