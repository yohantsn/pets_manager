
import 'package:pets_manager/app/models/pets/health_model.dart';

class HealthRepositorie{

  Future<List<HealthModel>> getListHealth() async {
    List<HealthModel> _listHealth = List<HealthModel>();
    _listHealth.add(HealthModel.fromJson({
      "health_description": "lorem ipsum lorem ipsum",
      "health_category": "doenças",
      "health_sub_category": "outras",
      "health_date": "2020-10-14 06:00:00:0000",
      "health_recovery": true
    }));
  }

  Future<void> addHealth(HealthModel _healthModel) async{
    print(_healthModel.toJson());
    await Future.delayed(Duration(seconds: 1));
  }
}