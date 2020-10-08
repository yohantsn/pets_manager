import 'package:flutter/material.dart';
import 'package:pets_manager/models/pets_model.dart';
import 'package:pets_manager/views/pet/tabs/case_vaccine_tab_view.dart';
import 'package:pets_manager/views/pet/tabs/list_vaccine_tab_view.dart';

class PetVaccinesView extends StatefulWidget {
  final PetsModel petsModel;
  PetVaccinesView({@required this.petsModel});
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
            title: Text("Notificações"),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Capa'),
                Tab(
                  text: 'Vacinas',
                ),
              ],
            ),
          ),
          body: SafeArea(
              child: TabBarView(
            children: [
              CaseVaccineTabView(),
              ListVaccineTabView(
                petsModel: widget.petsModel,
              ),
            ],
          )),
        ));
  }
}
