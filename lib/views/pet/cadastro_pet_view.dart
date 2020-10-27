import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pets_manager/controllers/pet/cadastro_pet_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/views/home_view.dart';

class NewPetScreen extends StatefulWidget {
  final UserModel userModel;
  NewPetScreen({this.userModel});
  @override
  _NewPetScreenState createState() => _NewPetScreenState();
}

class _NewPetScreenState extends State<NewPetScreen> {
  CadastroPetController _cadastroPetController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cadastroPetController = CadastroPetController(userModel: widget.userModel);
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
              child: Observer(
        builder: (_) => Form(
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
                              image: _cadastroPetController.imgFile.isNotEmpty
                                  ? FileImage(
                                      File(_cadastroPetController.imgFile))
                                  : AssetImage("assets/images/cao.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      onTap: () {
                        _cadastroPetController.takePicture();
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
                          _cadastroPetController.takePicture();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Observer(
                builder: (_) => Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    controller: _cadastroPetController.controllerNome,
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
                        borderSide:
                            BorderSide(color: Color_Scheme.primaryColor),
                      ),
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
                          child: Observer(
                            builder: (_) => DropdownButton(
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
                                items: _cadastroPetController.listEspecies
                                    .map((String dropDownStringItem) {
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
                                  _cadastroPetController
                                      .changedEspecie(novoItemSelecionado);
                                },
                                value: _cadastroPetController.especieSelec),
                          )),
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
                        child: Observer(
                          builder: (_) => DropdownButton(
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
                              items: _cadastroPetController.listSex
                                  .map((String dropDownStringItem) {
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
                                _cadastroPetController
                                    .changedSexo(novoItemSelecionado);
                              },
                              value: _cadastroPetController.sexSelec),
                        ),
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
              Observer(
                builder: (_) => Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    controller: _cadastroPetController.controllerCor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.color_lens,
                        color: Color_Scheme.primaryColor,
                      ),
                      labelText: "Cor",
                      labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color_Scheme.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    controller: _cadastroPetController.controllerDateNasc,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Color_Scheme.primaryColor,
                      ),
                      labelText: "Data de Nascimento",
                      labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color_Scheme.primaryColor),
                      ),
                    ),
                    onTap: () {
                      _cadastroPetController.showDatePicker(context);
                    },
                  ),
                ),
              ),
              Observer(
                builder: (_) => Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    controller: _cadastroPetController.controllerRaca,
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
                        borderSide:
                            BorderSide(color: Color_Scheme.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => Padding(
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
                        borderSide:
                            BorderSide(color: Color_Scheme.primaryColor),
                      ),
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
                                builder: (context) => HomeView()));
                      },
                    )),
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
