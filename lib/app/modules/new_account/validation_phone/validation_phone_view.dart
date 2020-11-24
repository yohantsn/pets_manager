
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_manager/app/modules/new_account/validation_phone/validation_phone_controller.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';

class ValidationPhoneView extends StatefulWidget {
  final UserModel userModel;

  ValidationPhoneView({this.userModel});

  @override
  _ValidationPhoneViewState createState() => _ValidationPhoneViewState();
}

class _ValidationPhoneViewState extends State<ValidationPhoneView> {
  ValidationPhoneController _validationPhoneController = ValidationPhoneController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         key: _validationPhoneController.scaffoldKey,
        backgroundColor: Color_Scheme.primaryColor,
        body: Observer(
          builder: (_) =>
          _validationPhoneController.isLoading ?
          Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                      'assets/lotties/loading.json',
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.50,
                      alignment: Alignment.center,
                      fit: BoxFit.fill
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Aguarde, validando código ...",
                      style: TextStyle(
                          color: Color_Scheme.secondaryLigthColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
          )
              :SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          10, MediaQuery.of(context).size.height * 0.08, 10, 10),
                      child: Text(
                        "Código de Verificação",
                        style: TextStyle(
                            color: Color_Scheme.secondaryLigthColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "Por favor, digite o código "
                            "que enviamos para o seu telefone ${widget.userModel.ownerPhone} ",
                        style: TextStyle(
                          color: Color_Scheme.secondaryLigthColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color_Scheme.secondaryLigthColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.13,
                              alignment: Alignment.center,
                              child: Observer(
                                builder: (_) => Text(
                                  "${_validationPhoneController.n1}",
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),

                                ),
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color_Scheme.secondaryLigthColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.13,
                              alignment: Alignment.center,
                              child:  Observer(
                                builder: (_) => Text(
                                  "${_validationPhoneController.n2}",
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),

                                ),
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color_Scheme.secondaryLigthColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.13,
                              alignment: Alignment.center,
                              child:  Observer(
                                builder: (_) => Text(
                                  "${_validationPhoneController.n3}",
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),

                                ),
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color_Scheme.secondaryLigthColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.13,
                              alignment: Alignment.center,
                              child:  Observer(
                                builder: (_) => Text(
                                  "${_validationPhoneController.n4}",
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),

                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("1", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("2", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("3", context: context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("4", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("5", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "6",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("6", context: context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "7",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("7", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "8",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("8", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "9",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("9", context: context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed:  null,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.preencheCode("0", context: context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              child: Text(
                                "Del",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color_Scheme.secondaryLigthColor),
                              ),
                              onPressed: () {
                                _validationPhoneController.deleteNumber();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                        child: Text(
                          "Meu número não é esse",
                          style: TextStyle(
                              color: Color_Scheme.secondaryLigthColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline
                          ),

                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
