import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pets_manager/controllers/pet/list_vaccine_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets/pets_model.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/views/pet/new_vaccine_view.dart';

class ListVaccineTabView extends StatefulWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;
  final UserModel userModel;

  ListVaccineTabView({@required this.petsModel, this.color_scheme, this.userModel});

  @override
  _ListVaccineTabViewState createState() => _ListVaccineTabViewState();
}

class _ListVaccineTabViewState extends State<ListVaccineTabView> {
  ListVaccineController _listVaccineController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listVaccineController = ListVaccineController(pets: widget.petsModel,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color_scheme.themeColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: widget.color_scheme.themeColor,
          ),
          backgroundColor: Color_Scheme.primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewVaccineView(
                          petsModel: widget.petsModel,
                          color_scheme: widget.color_scheme,
                          userModel: widget.userModel,
                        )));
          },
        ),
        body: Observer(
          builder: (_) => _listVaccineController.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                    ),
                    Expanded(child: Observer(
                      builder: (_) {
                        return _listVaccineController.petsModel.listVaccineModel == null
                        ? Container()
                        : ListView.builder(
                          itemCount:
                              _listVaccineController.petsModel.listVaccineModel.length,
                          itemBuilder: (context, index) {
                            return _listBuilder(context, index);
                          },
                        );
                      },
                    ))
                  ],
                ),
        ));
  }

  Widget _listBuilder(BuildContext context, int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color_Scheme.secondaryColor),
          borderRadius: BorderRadius.circular(10)),
      color: widget.color_scheme.lightColorTheme,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "${_listVaccineController.petsModel.listVaccineModel[index].nameVaccine}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color_Scheme.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "${_listVaccineController.petsModel.listVaccineModel[index].makerVaccine}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color_Scheme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Aplicado em ${_listVaccineController.petsModel.listVaccineModel[index].dateApplication}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color_Scheme.primaryColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Retorno em ${_listVaccineController.petsModel.listVaccineModel[index].dateReturn}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color_Scheme.colorRed,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                          child: Text(
                            "Aplicado por ${_listVaccineController.petsModel.listVaccineModel[index].nameVeterinary}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color_Scheme.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "CRMV: ${_listVaccineController.petsModel.listVaccineModel[index].numCrmVeterinary}-${_listVaccineController.petsModel.listVaccineModel[index].ufCrmVeterinary}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color_Scheme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
