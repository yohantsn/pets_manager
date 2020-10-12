import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets/pets_model.dart';

class NewVaccineView extends StatelessWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;

  NewVaccineView({this.color_scheme, this.petsModel});

  var controllerDateApl = new MaskedTextController(mask: '00/00/0000');
  var controllerDateRet = new MaskedTextController(mask: '00/00/0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color_scheme.primaryColorTheme,
          iconTheme: IconThemeData(color: Color_Scheme.secondaryLigthColor),
          title: Text(
            "Nova Vacina",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: color_scheme.themeColor,
        body: SafeArea(
            child: Form(
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
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nome",
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
                    labelText: "Marca",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: controllerDateApl,
                        decoration: InputDecoration(
                          labelText: "Data da Aplicação",
                          labelStyle:
                              TextStyle(color: Color_Scheme.primaryColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color_Scheme.primaryColor),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: controllerDateRet,
                        decoration: InputDecoration(
                          labelText: "Data do Retorno",
                          labelStyle:
                              TextStyle(color: Color_Scheme.primaryColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color_Scheme.primaryColor),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Veterinário Responsável",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "CRMV",
                          labelStyle:
                              TextStyle(color: Color_Scheme.primaryColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color_Scheme.primaryColor),
                          ),
                        ),
                      ),
                    )),
                   Expanded(
                     child: Padding(
                       padding: EdgeInsets.all(10),
                       child:  TextFormField(
                         decoration: InputDecoration(
                           labelText: "UF",
                           labelStyle:
                           TextStyle(color: Color_Scheme.primaryColor),
                           enabledBorder: UnderlineInputBorder(
                             borderSide:
                             BorderSide(color: Color_Scheme.primaryColor),
                           ),
                         ),
                       ),
                     )
                   )
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
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => PetListView()));
                      },
                    )),
              ),
            ],
          ),
        ))));
  }
}
