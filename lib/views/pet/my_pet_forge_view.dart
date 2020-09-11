import "package:flutter/material.dart";
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets_model.dart';

class MyPetForgetView extends StatelessWidget {
  final PetsModel _petsModel;

  MyPetForgetView(this._petsModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Meu Pet Fugiu",
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Onde você viu ${this._petsModel.sex == "M" ? "o" : "a"} ${this._petsModel.namePet} pela última vez?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color_Scheme.primaryColor),
              ),
            ),
           Padding(
             padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
             child: TextFormField(
               decoration: InputDecoration(labelText: "Endereço"),

             ),
           )
          ],
        ))));
  }
}
