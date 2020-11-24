import 'package:flutter/material.dart';
import 'package:pets_manager/app/modules/pet/pet_general/pet_general_controller.dart';
import 'package:pets_manager/app/modules/pet/vaccine_tab/pet_vaccine_view.dart';
import 'package:pets_manager/app/modules/places/list_petshops/list_petshops_view.dart';
import 'package:pets_manager/app/modules/places/list_petshops/petplaces_controller.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/places/pet_places_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/places/list_veterinary/list_veterinaries_view.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


class PetGeneralView extends StatefulWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;
  final bool darkMode;
  final UserModel userModel;

  PetGeneralView({this.petsModel, this.color_scheme, this.darkMode, this.userModel});

  @override
  _PetGeneralViewState createState() => _PetGeneralViewState();
}

class _PetGeneralViewState extends State<PetGeneralView> {

  PetGeneralController petGeneralController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    petGeneralController = PetGeneralController(color_scheme: widget.color_scheme, userModel: widget.userModel, petsModel: widget.petsModel);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: petGeneralController.color_scheme.primaryColorTheme,
        iconTheme: IconThemeData(
            color: Color_Scheme.secondaryLigthColor
        ),
        title: Text(
          "Meu Pet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: petGeneralController.color_scheme.themeColor,
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
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Card(
                            elevation: 5,
                            margin: EdgeInsets.only(right: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: Color_Scheme.colorRed,
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.40,
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/alarme.png",
                                    height:
                                    MediaQuery.of(context).size.width * 0.15,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      petGeneralController.petsModel.isForget
                                          ? "Encontrei ${petGeneralController.petsModel.namePet}!"
                                          : "${petGeneralController.petsModel.namePet} Fugiu!",
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

                        },
                      ),
                      GestureDetector(
                        child: Card(
                            elevation: 5,
                            margin: EdgeInsets.only(left: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: petGeneralController.color_scheme.lightColorTheme,
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.40,
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/vacina.png",
                                    height:
                                    MediaQuery.of(context).size.width * 0.15,
                                    width: MediaQuery.of(context).size.width * 0.15,
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetVaccinesView(
                                    petsModel: petGeneralController.petsModel,
                                    color_scheme: petGeneralController.color_scheme,
                                    userModel: petGeneralController.userModel,
                                  )));
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Card(
                            elevation: 5,
                            margin: EdgeInsets.only(right: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: petGeneralController.color_scheme.lightColorTheme,
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.40,
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/veterinario.png",
                                    height:
                                    MediaQuery.of(context).size.width * 0.15,
                                    width: MediaQuery.of(context).size.width * 0.15,
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
                        onTap: () {
                          _getPetPlace().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListVeterinariesView(
                                      petPlacesModel: value,
                                      color_scheme: petGeneralController.color_scheme,
                                    )));
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Card(
                              elevation: 5,
                              margin: EdgeInsets.only(left: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              color: petGeneralController.color_scheme.lightColorTheme,
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.40,
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/banho_pet.png",
                                      height:
                                      MediaQuery.of(context).size.width * 0.15,
                                      width:
                                      MediaQuery.of(context).size.width * 0.15,
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
                            _getPetPlace().then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListPetShopsView(
                                        petPlacesModel: value,
                                        color_scheme: petGeneralController.color_scheme,
                                      )));
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      40,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: GestureDetector(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color_Scheme.secondaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        color: petGeneralController.color_scheme.lightColorTheme,
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
                                  "Alterar dados ${petGeneralController.petsModel.sex == "M" ? "do" : "da"} ${petGeneralController.petsModel.namePet}",
                                  style: TextStyle(
                                      fontSize: 18, color: Color_Scheme.primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      5,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: GestureDetector(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color_Scheme.secondaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        color: petGeneralController.color_scheme.lightColorTheme,
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
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      5,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: GestureDetector(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color_Scheme.secondaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        color: petGeneralController.color_scheme.lightColorTheme,
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
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      5,
                      MediaQuery.of(context).size.width * 0.05,
                      5),
                  child: GestureDetector(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color_Scheme.secondaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        color: petGeneralController.color_scheme.lightColorTheme,
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
                      )),
                ),
              ],
            ),
          )),
    );
  }
  Future<PetPlacesModel> _getPetPlace() async {
    return await PetPlacesController().getPetPlaces();
  }
}

