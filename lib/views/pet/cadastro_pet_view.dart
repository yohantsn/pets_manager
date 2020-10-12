import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/repositories/general/list_especies.dart';
import 'package:pets_manager/repositories/general/list_sex.dart';
import 'package:pets_manager/views/pet/list_pet_view.dart';

class NewPetScreen extends StatefulWidget {
  @override
  _NewPetScreenState createState() => _NewPetScreenState();
}

class _NewPetScreenState extends State<NewPetScreen> {
  var listEspecies = Especies.getEspecies();
  var listSex = Sex.getListSexPet();
  String sexSelec = "";
  bool isSexoSelec = false;
  String especieSelec = "";
  bool isEspecieSelec = false;
  File _file;
  String _imgFile = "";

  Future<void> _takePicture() async {
    _file = await ImagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 40);
    setState(() {
      _imgFile = _file.path;
    });
    return;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    especieSelec = listEspecies.first;
    sexSelec = listSex.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Novo Pet",
          style: TextStyle(color: Color_Scheme.primaryColor, fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: _imgFile.isNotEmpty
                                  ? FileImage(File(_imgFile))
                                  : AssetImage("assets/images/cao.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      onTap: () {
                        _takePicture();
                      },
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.camera_alt,
                          color: Color_Scheme.primaryColor,
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _takePicture();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Image.asset(
                      "assets/images/colarinho.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                    labelText: "Nome do pet",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 38.0),
                        child: DropdownButton(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color_Scheme.primaryColor,
                            ),
                            hint: Text(
                              "Selecione a especie",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color_Scheme.primaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            isExpanded: true,
                            items:
                                listEspecies.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor,
                                      fontSize: 16),
                                ),
                              );
                            }).toList(),
                            onChanged: (String novoItemSelecionado) {
                              setState(() {
                                isEspecieSelec = true;
                                this.especieSelec = novoItemSelecionado;
                              });
                            },
                            value: especieSelec),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15, left: 0),
                          child: Image.asset(
                            "assets/images/pata.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          )),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 38.0),
                        child: DropdownButton(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color_Scheme.primaryColor,
                            ),
                            hint: Text(
                              "Selecione o Sexo",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color_Scheme.primaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            isExpanded: true,
                            items: listSex.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor,
                                      fontSize: 16),
                                ),
                              );
                            }).toList(),
                            onChanged: (String novoItemSelecionado) {
                              setState(() {
                                isSexoSelec = true;
                                this.sexSelec = novoItemSelecionado;
                              });
                            },
                            value: sexSelec),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15, left: 0),
                          child: Image.asset(
                            "assets/images/sex.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          )),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.color_lens,
                      color: Color_Scheme.primaryColor,
                    ),
                    labelText: "Cor",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Color_Scheme.primaryColor,
                    ),
                    labelText: "Idade",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Image.asset(
                      "assets/images/raca.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                    labelText: "Raça",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Image.asset(
                      "assets/images/chip.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                    labelText: "Microchip",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetListView()));
                      },
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
