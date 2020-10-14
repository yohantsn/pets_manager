import 'package:pets_manager/models/pets/vaccine_model.dart';

class VaccineRepositorie{
  Future<List<VaccineModel>> getListVaccine({String idPet}) async{
    List<VaccineModel> _listVaccineModel =  List<VaccineModel>();
        List<Map<String,dynamic>> _listMap = [
      {
        "name_vaccine": "GiardiaVax",
        "maker_vaccine": "Zoetis",
        "date_application": "10/10/2019",
        "date_return" : "10/10/2020",
        "photo_label" : "https://www.petsveterinaria.com.br/imagens/vacina-para-cachorro-contra-raiva.jpg",
        "name_veterinary": "Maria Eduarda Wolff do Rosário",
        "num_crm_veterinary" : "123456",
        "uf_crm_veterinary" : "PR"
      },
      {
        "name_vaccine": "Rabies Vaccine Imrab",
        "maker_vaccine": "Merial",
        "date_application": "05/01/2020",
        "date_return" : "05/01/2021",
        "photo_label" : "https://www.spotswoodvet.com/wp-content/uploads/2018/02/rabies-vax.jpg",
        "name_veterinary": "Maria Eduarda Wolff do Rosário",
        "num_crm_veterinary" : "123456",
        "uf_crm_veterinary" : "PR"
      },{
        "name_vaccine": "Vermifugo Duprantel",
        "maker_vaccine": "Duprant",
        "date_application": "05/01/2020",
        "date_return" : "05/06/2020",
        "photo_label" : "https://www.petlove.com.br/images/products/229872/product/Verm%C3%ADfugo_Duprat_Duprantel_Plus_para_C%C3%A3es_2337352_1.jpg?1600781604",
        "name_veterinary": "Maria Eduarda Wolff do Rosário",
        "num_crm_veterinary" : "123456",
        "uf_crm_veterinary" : "PR"
      }
    ];
    _listMap.forEach((element) {
      _listVaccineModel.add(VaccineModel.fromJson(element));
    });
    return _listVaccineModel;
  }

  Future<void> addVaccine(VaccineModel vaccineModel)async{
    print(vaccineModel.toJson().toString());
    await  Future.delayed(Duration(seconds: 2));
    //TODO-add firebase
  }
}