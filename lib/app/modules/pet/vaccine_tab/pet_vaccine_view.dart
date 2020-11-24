import 'package:flutter/material.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


import 'case_vaccine_tab_view.dart';
import 'list_vaccine/list_vaccine_tab_view.dart';


class PetVaccinesView extends StatefulWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;
  final UserModel userModel;
  PetVaccinesView({@required this.petsModel, this.color_scheme, this.userModel});
  @override
  _PetVaccinesViewState createState() => _PetVaccinesViewState();
}

class _PetVaccinesViewState extends State<PetVaccinesView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Carteira de Vacinação",
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(
                color: Color_Scheme.secondaryLigthColor
            ),
            backgroundColor: widget.color_scheme.primaryColorTheme,
            bottom: TabBar(
              labelColor: Color_Scheme.secondaryLigthColor,
              tabs: [
                Tab(
                  text: "Capa",
                ),
                Tab(
                  text: 'Vacinas',
                ),
              ],
            ),
          ),
          backgroundColor: widget.color_scheme.themeColor,
          body: SafeArea(
              child: TabBarView(
            children: [
              CaseVaccineTabView(
                petsModel: widget.petsModel,
                color_scheme: widget.color_scheme,
              ),
              ListVaccineTabView(
                color_scheme: widget.color_scheme,
                petsModel: widget.petsModel,
                userModel: widget.userModel,
              ),
            ],
          )),
        ));
  }
}
