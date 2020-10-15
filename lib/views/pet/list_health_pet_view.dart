import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pets_manager/controllers/pet/list_health_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets/pets_model.dart';

class ListHealthPetView extends StatefulWidget {

  final PetsModel petsModel;
  final Color_Scheme color_scheme;

  ListHealthPetView({this.color_scheme, this.petsModel});
  @override
  _ListHealthPetViewState createState() => _ListHealthPetViewState();
}

class _ListHealthPetViewState extends State<ListHealthPetView> {

  ListHealthController _listHealthController = ListHealthController();

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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => NewVaccineView(
            //           petsModel: widget.petsModel,
            //           color_scheme: widget.color_scheme,
            //         )));
          },
        ),
        body: Observer(
          builder: (_) => _listHealthController.isLoading
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
                  return ListView.builder(
                    itemCount:
                    _listHealthController.listHealthModel.length,
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
                            "${_listHealthController.listHealthModel[index].healthCategory}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color_Scheme.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "${_listHealthController.listHealthModel[index].healthSubCategory}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color_Scheme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
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
                            "${_listHealthController.listHealthModel[index].healthDescription}",
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
