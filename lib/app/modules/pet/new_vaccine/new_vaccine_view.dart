import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pets_manager/app/modules/pet/vaccine_tab/list_vaccine/list_vaccine_controller.dart';
import 'package:pets_manager/app/modules/pet/new_vaccine/new_vaccine_controller.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


class NewVaccineView extends StatefulWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;
  final UserModel userModel;
  final ListVaccineController listVaccineController;

  NewVaccineView({this.color_scheme, this.petsModel, this.userModel, this.listVaccineController});

  @override
  _NewVaccineViewState createState() => _NewVaccineViewState();
}

class _NewVaccineViewState extends State<NewVaccineView> {
  NewVaccineController _newVaccineController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newVaccineController = NewVaccineController(
        color_scheme: widget.color_scheme,
        petsModels: widget.petsModel,
        userModel: widget.userModel,
        listVaccineController: widget.listVaccineController
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color_scheme.primaryColorTheme,
          iconTheme: IconThemeData(color: Color_Scheme.secondaryLigthColor),
          title: Text(
            "Nova Vacina",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: widget.color_scheme.themeColor,
        body: SafeArea(
            child: Observer(
          builder: (_) => _newVaccineController.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _newVaccineController.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Observer(
                              builder: (_) => TextFormField(
                                controller:
                                    _newVaccineController.controllerName,
                                style:
                                    TextStyle(color: Color_Scheme.primaryColor),
                                decoration: InputDecoration(
                                  labelText: "Nome",
                                  labelStyle: TextStyle(
                                      color: Color_Scheme.primaryColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Scheme.primaryColor),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Nome da Vacina é obrigatório.";
                                  }
                                },
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Observer(
                              builder: (_) => TextFormField(
                                controller:
                                    _newVaccineController.controllerMaker,
                                style:
                                    TextStyle(color: Color_Scheme.primaryColor),
                                decoration: InputDecoration(
                                  labelText: "Marca",
                                  labelStyle: TextStyle(
                                      color: Color_Scheme.primaryColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Scheme.primaryColor),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Marca da Vacina é obrigatório.";
                                  }
                                },
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Observer(
                                        builder: (_) => TextFormField(
                                          readOnly: true,
                                          controller: _newVaccineController
                                              .controllerDateApl,
                                          style: TextStyle(
                                              color: Color_Scheme.primaryColor),
                                          decoration: InputDecoration(
                                            labelText: "Data da Aplicação",
                                            labelStyle: TextStyle(
                                                color:
                                                    Color_Scheme.primaryColor),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color_Scheme
                                                      .primaryColor),
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          // Only numbers can be entered
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Data de Aplicação é obrigatória.";
                                            }
                                          },
                                          onTap: () {
                                            _newVaccineController
                                                .showDatePicker(context, true);
                                          },
                                        ),
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Observer(
                                        builder: (_) => TextFormField(
                                          controller: _newVaccineController
                                              .controllerDateRet,
                                          readOnly: true,
                                          style: TextStyle(
                                              color: Color_Scheme.primaryColor),
                                          decoration: InputDecoration(
                                            labelText: "Data do Retorno",
                                            labelStyle: TextStyle(
                                                color:
                                                    Color_Scheme.primaryColor),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color_Scheme
                                                      .primaryColor),
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Data de retorno é obrigatório.";
                                            }
                                          },
                                          onTap: () {
                                            _newVaccineController
                                                .showDatePicker(context, false);
                                          },
                                        ),
                                      )))
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Observer(
                              builder: (_) => TextFormField(
                                controller: _newVaccineController.controllerVet,
                                style:
                                    TextStyle(color: Color_Scheme.primaryColor),
                                decoration: InputDecoration(
                                  labelText: "Veterinário Responsável",
                                  labelStyle: TextStyle(
                                      color: Color_Scheme.primaryColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color_Scheme.primaryColor),
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Observer(
                                        builder: (_) => TextFormField(
                                          controller: _newVaccineController
                                              .controllerCRM,
                                          style: TextStyle(
                                              color: Color_Scheme.primaryColor),
                                          decoration: InputDecoration(
                                            labelText: "CRMV",
                                            labelStyle: TextStyle(
                                                color:
                                                    Color_Scheme.primaryColor),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color_Scheme
                                                      .primaryColor),
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (_newVaccineController
                                                .controllerVet
                                                .text
                                                .isNotEmpty) {
                                              if (value.isEmpty) {
                                                return "CRMV do veterinário obrigatório.";
                                              }
                                            }
                                          },
                                        ),
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Observer(
                                        builder: (_) => TextFormField(
                                          controller: _newVaccineController
                                              .controllerCRMUF,
                                          style: TextStyle(
                                              color: Color_Scheme.primaryColor),
                                          decoration: InputDecoration(
                                            labelText: "UF",
                                            labelStyle: TextStyle(
                                                color:
                                                    Color_Scheme.primaryColor),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color_Scheme
                                                      .primaryColor),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (_newVaccineController
                                                .controllerVet
                                                .text
                                                .isNotEmpty) {
                                              if (value.isEmpty) {
                                                return "UF do CRMV do veterinário obrigatório.";
                                              }
                                            }
                                          },
                                        ),
                                      )))
                            ],
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
                                  _newVaccineController.saveVaccine(context: context);
                                },
                              )),
                        ),
                      ],
                    ),
                  )),
        )));
  }
}
