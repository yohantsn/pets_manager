import 'package:flutter/material.dart';
import 'package:pets_manager/controllers/pet/list_vaccine_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets_model.dart';

class ListVaccineTabView extends StatefulWidget {
  final PetsModel petsModel;
  ListVaccineTabView({@required this.petsModel});

  @override
  _ListVaccineTabViewState createState() => _ListVaccineTabViewState();
}

class _ListVaccineTabViewState extends State<ListVaccineTabView> {
  ListVaccineController _listVaccineController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listVaccineController = ListVaccineController(pets: widget.petsModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _listVaccineController.listVaccineModel.length,
                  itemBuilder: (context, index){
                    return _listBuilder(context,index);
                  },
              )
          )
        ],
      ),
    );
  }


  Widget _listBuilder(BuildContext context, int index){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color_Scheme.secondaryColor),
          borderRadius: BorderRadius.circular(10)),
      color: Color_Scheme.secondaryLigthColor,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                _listVaccineController
                    .listVaccineModel[index].photoLabel,
                height: 35,
                width: 35,
                alignment: Alignment.centerLeft,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "${_listVaccineController.listVaccineModel[index].nameVaccine}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color_Scheme.primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "${_listVaccineController.listVaccineModel[index].makerVaccine}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color_Scheme.primaryColor),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Aplicado em ${_listVaccineController.listVaccineModel[index].dateApplication}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color_Scheme.primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Retorno em ${_listVaccineController.listVaccineModel[index].makerVaccine}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color_Scheme.primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
