import 'package:mobx/mobx.dart';
import 'package:pets_manager/models/pet_forget_model.dart';
import 'package:pets_manager/repositories/pets_forget_repositorie.dart';
part 'pets_forget_controller.g.dart';

class PetsForgetController = PetsForgetControllerStore with _$PetsForgetController;

abstract class PetsForgetControllerStore with Store{

  @observable
  List<PetForgetModel> listPetForget = List<PetForgetModel>();

  @observable
  PetForgetModel petForgetModel = PetForgetModel();

  @action
  void getListPetsForget() async{
    List<Map<String,dynamic>> _list = await PetsForgetRepositorie.getListPetsForgetRepositorie();
    List<PetForgetModel> _listPetsForget = List<PetForgetModel>();
    _list.forEach((element) {
      PetForgetModel _petForgetModel = PetForgetModel.fromJson(element);
      _listPetsForget.add(_petForgetModel);
    });
    this.listPetForget = _listPetsForget;
  }

  @action
  void getPetForgetById(String id, String uid) {
    Map<String,dynamic> _map ;
    PetsForgetRepositorie.getPetForgetByIdRepositorie(id, uid).then((value){
      _map = value;
      if(_map.isNotEmpty && _map != null){
        this.petForgetModel = PetForgetModel.fromJson(_map);
      }
    });
  }
}