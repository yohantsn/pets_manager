import 'package:flutter/material.dart';
import 'package:pets_manager/controllers/petplaces_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pet_places_model.dart';
import 'package:pets_manager/models/pets_model.dart';
import 'package:pets_manager/views/places/list_petshops_view.dart';
import 'package:pets_manager/views/places/list_veterinaries_view.dart';

class PetGeneralView extends StatelessWidget {
  final PetsModel _petsModel;

  PetGeneralView(this._petsModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu Pet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.35,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Color_Scheme.colorRed,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/alarme.png",
                                height:
                                MediaQuery.of(context).size.width * 0.13,
                                width: MediaQuery.of(context).size.width * 0.13,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "${this._petsModel.namePet} Fugiu!",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color_Scheme.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.35,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Color_Scheme.secondaryLigthColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/vacina.png",
                                height:
                                MediaQuery.of(context).size.width * 0.13,
                                width: MediaQuery.of(context).size.width * 0.13,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Carteira de Vacinação",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color_Scheme.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.35,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Color_Scheme.secondaryLigthColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/veterinario.png",
                                height:
                                MediaQuery.of(context).size.width * 0.13,
                                width: MediaQuery.of(context).size.width * 0.13,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Agendar Consulta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color_Scheme.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )),
                    onTap: ()  {
                      _getPetPlace().then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListVeterinariesView(petPlacesModel: value,)));
                      });
                    },
                  ),
                  GestureDetector(
                    child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.35,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Color_Scheme.secondaryLigthColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/banho_pet.png",
                                height:
                                MediaQuery.of(context).size.width * 0.13,
                                width: MediaQuery.of(context).size.width * 0.13,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Banho e Tosa",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color_Scheme.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )),
                    onTap: () {
                      _getPetPlace().then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListPetShopsView(petPlacesModel: value,)));
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: GestureDetector(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color_Scheme.secondaryColor),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/pata.png",
                            height: 35,
                            width: 35,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Alterar dados ${this._petsModel.sex == "M" ? "do" : "da"} ${this._petsModel.namePet}",
                            style: TextStyle(
                                fontSize: 18, color: Color_Scheme.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: GestureDetector(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color_Scheme.secondaryColor),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/images/droga.png",
                              height: 35,
                              width: 35,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Lembrete de Medicamentos",
                              style: TextStyle(
                                  fontSize: 18, color: Color_Scheme.primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: GestureDetector(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color_Scheme.secondaryColor),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/images/bisturi.png",
                              height: 35,
                              width: 35,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Registrar Cirurgia",
                              style: TextStyle(
                                  fontSize: 18, color: Color_Scheme.primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: GestureDetector(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color_Scheme.secondaryColor),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/images/virus.png",
                              height: 35,
                              width: 35,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Registrar estado de saúde",
                              style: TextStyle(
                                  fontSize: 18, color: Color_Scheme.primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<PetPlacesModel> _getPetPlace() async{
   return await PetPlacesController().getPetPlaces();
  }
}
