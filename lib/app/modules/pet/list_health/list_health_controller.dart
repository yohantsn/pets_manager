import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/health_model.dart';
import 'package:pets_manager/app/shared/repositories/pets/health_repositorie.dart';


part 'list_health_controller.g.dart';

class ListHealthController = _ListHealthControllerStore
    with _$ListHealthController;

abstract class _ListHealthControllerStore with Store {
  _ListHealthControllerStore(){
    getListHealth();
  }

  @observable
  List<HealthModel> listHealthModel = List<HealthModel>();

  @observable
  bool isLoading = false;

  @action
  void getListHealth(){
    this.isLoading = true;
    HealthRepositorie().getListHealth().then((value){
      listHealthModel = value;
      this.isLoading = false;
    });
  }

}