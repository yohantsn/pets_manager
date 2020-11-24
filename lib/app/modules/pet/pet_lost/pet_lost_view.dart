import 'package:flutter/material.dart';
import 'package:pets_manager/app/modules/pet/pet_lost/pet_lost_controller.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


class PetLostView extends StatefulWidget {
  final PetsModel petsModel;
  final Color_Scheme color_scheme;
  final UserModel userModel;

  PetLostView({this.petsModel, this.color_scheme, this.userModel});

  @override
  _PetLostViewState createState() => _PetLostViewState();
}

class _PetLostViewState extends State<PetLostView> {
  PetLostController petLostController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    petLostController = PetLostController(petsModel: widget.petsModel, userModel: widget.userModel);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color_scheme.primaryColorTheme,
          title: Text(
            "Meu Pet Fugiu",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color_Scheme.secondaryLigthColor),
        ),
        backgroundColor: widget.color_scheme.themeColor,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text( "Você encontrou "
                        "${widget.petsModel.sex == "F" ? "a" : "o"} "
                        "${widget.petsModel.namePet} ?"
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                            height: 45,
                            width:
                            MediaQuery.of(context).size.width * 0.45,
                            child: RaisedButton(
                              child: Text(
                                "Ainda Não",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              color: Color_Scheme.colorRed,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(25.0),
                              ),
                              onPressed: () {
                                this.showDialog(context);
                              },
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                            height: 45,
                            width:
                            MediaQuery.of(context).size.width * 0.45,
                            child: RaisedButton(
                              child: Text(
                                "Sim",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              color: Color_Scheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(25.0),
                              ),
                              onPressed: () {
                                petLostController.petFind(context: context);
                              },
                            )),
                      ),
                    ],
                  )
                ],
              )
            )));
  }

  void showDialog(BuildContext context) {
    AlertDialog(
      content: new Text(
          "Ficamos tristes com essa noticia, "
              "mas estamos em contato com outros tutores "
              "para tentar localizar ${widget.petsModel.sex == "F" ? "a" : "o"} ${widget.petsModel.namePet}"),
      actions: <Widget>[
        // define os botões na base do dialogo
        FlatButton(
          child: new Text(
            "Ok",
            style: TextStyle(color: Color_Scheme.colorRed),
          ),
          onPressed: () {
            petLostController.petLost(context: context);
          },
        ),
      ],
    );
  }
}
