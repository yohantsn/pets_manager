import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_manager/controllers/new_account/validation_phone_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';

class ValidationPhoneView extends StatefulWidget {
  final String phoneNumber;

  ValidationPhoneView({this.phoneNumber});

  @override
  _ValidationPhoneViewState createState() => _ValidationPhoneViewState();
}

class _ValidationPhoneViewState extends State<ValidationPhoneView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool _isValid = false;
  String _n1 = "";
  String _n2 = "";
  String _n3 = "";
  String _n4 = "";


  void _preencheCode(String _nDigit) async {
    if(_n1.isEmpty){
      setState(() {
        _n1 = _nDigit;
      });
      return;
    }
    if(_n2.isEmpty){
      setState(() {
        _n2 = _nDigit;
      });
      return;
    }
    if(_n3.isEmpty){
      setState(() {
        _n3 = _nDigit;
      });
      return;
    }
    if(_n4.isEmpty){
      setState(() {
        _n4 = _nDigit;
        _isLoading = true;
        validCode();
      });
      return;
    }
  }

  void _deleteNumber(){
    if(_n4.isNotEmpty){
      setState(() {
        _n4 = "";
      });
      return;
    }
    if(_n3.isNotEmpty){
      setState(() {
        _n3 = "";
      });
      return;
    }
    if(_n2.isNotEmpty){
      setState(() {
        _n2 = "";
      });
      return;
    }
    if(_n1.isNotEmpty){
      setState(() {
        _n1 = "";
      });
      return;
    }
  }

  void validCode(){
    String code = "$_n1$_n2$_n3$_n4";
    log(code);
    ValidationPhoneController.isValid(code).then((value) {

      setState(() {
        _isLoading = false;
      });
      if(value){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPetScreen()));
      }else{
        _n1 = "";
        _n2 = "";
        _n3 = "";
        _n4 = "";
        _callSnackbar("Código digitado é inválido");
      }
    });

  }

  void _callSnackbar(String content) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         key: _scaffoldKey,
        backgroundColor: Color_Scheme.primaryColor,
        body: _isLoading ?
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
                  "que enviamos para o seu telefone ${widget.phoneNumber} ",
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
                        child: Text(
                          "$_n1",
                          style: TextStyle(
                            color: Color_Scheme.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),

                        ),
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
                        child:  Text(
                          "$_n2",
                          style: TextStyle(
                              color: Color_Scheme.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),

                        ),
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
                        child:  Text(
                          "$_n3",
                          style: TextStyle(
                              color: Color_Scheme.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),

                        ),
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
                        child:  Text(
                          "$_n4",
                          style: TextStyle(
                              color: Color_Scheme.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),

                        ),
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
                          _preencheCode("1");
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
                          _preencheCode("2");
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
                          _preencheCode("3");
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
                          _preencheCode("4");
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
                          _preencheCode("5");
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
                          _preencheCode("6");
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
                          _preencheCode("7");
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
                          _preencheCode("8");
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
                          _preencheCode("9");
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
                        onPressed:  () {

                        },
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
                          _preencheCode("0");
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
                          _deleteNumber();
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
        )));
  }
}
