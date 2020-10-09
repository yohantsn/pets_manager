import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:pets_manager/controllers/pet/my_pet_forget_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/core/commons_value.dart';
import 'package:pets_manager/models/pets/pets_model.dart';

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
  MapboxMapController mapboxMapController;
  TextEditingController txtController = TextEditingController();

  void _onMapCreated(MapboxMapController controller) {
    this.mapboxMapController = controller;
  }

  void _onStyleLoaded() {
    mapboxMapController.addSymbol(
      SymbolOptions(
        geometry: _myPetController.latLngClick,
        iconImage: "assets/images/location_pin.png",
        //iconSize: 5.0
      ),
    );
  }

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
          iconTheme: IconThemeData(
              color: Color_Scheme.secondaryLigthColor
          ),
        ),
        backgroundColor: widget.color_scheme.themeColor,
        body: SafeArea(
            child: SingleChildScrollView(
                child: _myPetController.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
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
                                  fontSize: 16,
                                  color: Color_Scheme.primaryColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.60,
                            width: MediaQuery.of(context).size.width,
                            child: MapboxMap(
                              onMapCreated: _onMapCreated,
                              onStyleLoadedCallback: _onStyleLoaded,
                              styleString: widget.darkMode ? MapboxStyles.DARK :MapboxStyles.LIGHT,
                              accessToken: CommonsValues().mapToken,
                              initialCameraPosition: CameraPosition(
                                  target: _myPetController.latLngClick,
                                  zoom: 14.0),
                              onMapClick: (valueDouble, latLng) {
                                _myPetController.getAddressClick(latLng);
                              },
                            ),
                          ),
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
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  onPressed: () {
                                    _myPetController.savePetForget(
                                        widget.petsModel,
                                        txtController.text ?? "");
                                  },
                                )),
                          ),
                        ],
                      ))));
  }
}
