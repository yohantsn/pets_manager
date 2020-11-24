import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:pets_manager/app/modules/pet/my_pet_forget/my_pet_forget_controller.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';
import 'package:pets_manager/app/shared/core/commons_value.dart';


class MyPetForgetView extends StatefulWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;
  final bool darkMode;

  MyPetForgetView({this.petsModel, this.color_scheme, this.darkMode});

  @override
  _MyPetForgetViewState createState() => _MyPetForgetViewState();
}

class _MyPetForgetViewState extends State<MyPetForgetView> {
  MyPetForgetController _myPetController = MyPetForgetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color_scheme.primaryColorTheme,
          title: Text(
            "Meu Pet Fugiu",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color_Scheme.secondaryLigthColor),
        ),
        backgroundColor: widget.color_scheme.themeColor,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Observer(
          builder: (_) => _myPetController.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _myPetController.isSucess
                  ? Container(
              height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Lamentamos que tenha perdido ${widget.petsModel.sex == "F" ? "a" : "o"}"
                                " ${widget.petsModel.namePet}, iremos notificar todos "
                                "os tutores proximos a sua região e eles poderão entrar "
                                "em contato com você.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color_Scheme.primaryColor),
                              ),
                            ),
                          ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: RaisedButton(
                                    child: Text(
                                      "Continuar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    color: Color_Scheme.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                    ),
                                    onPressed: () {
                                      _myPetController.savePetForget(
                                          widget.petsModel, context);
                                    },
                                  )),
                            ),
                        ],
                      ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Selecione no mapa onde você viu "
                            "${widget.petsModel.sex == "M" ? "o" : "a"} "
                            "${widget.petsModel.namePet} pela última vez?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, color: Color_Scheme.primaryColor),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.60,
                            width: MediaQuery.of(context).size.width,
                            child: Observer(
                              builder: (_) => MapboxMap(
                                onMapCreated: _myPetController.onMapCreated,
                                onStyleLoadedCallback:
                                    _myPetController.onStyleLoaded,
                                styleString: widget.darkMode
                                    ? MapboxStyles.DARK
                                    : MapboxStyles.LIGHT,
                                accessToken: CommonsValues().mapToken,
                                initialCameraPosition: CameraPosition(
                                    target: _myPetController.latLngClick,
                                    zoom: 14.0),
                                onMapClick: (valueDouble, latLng) {
                                  _myPetController.getAddressClick(latLng);
                                },
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Observer(
                              builder: (_) => Text(
                                "Endereço aproximado é  "
                                "${_myPetController.addressClick}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color_Scheme.primaryColor),
                              ),
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    controller: _myPetController.txtController,
                                    decoration: InputDecoration(
                                      hintText:
                                          "Mensagem para os outros tutores",
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: RaisedButton(
                                child: Text(
                                  "Salvar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                color: Color_Scheme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                onPressed: () {
                                  _myPetController.savePetForget(
                                      widget.petsModel, context);
                                },
                              )),
                        ),
                      ],
                    ),
        ))));
  }
}
