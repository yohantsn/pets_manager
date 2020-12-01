import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/modules/login/apresentacao/presentation_controller.dart';
import 'package:pets_manager/app/modules/login/login/login_controller.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';
import '../../new_account/create_account/create_account_view.dart';
import '../login/login_view.dart';

class PresentationView extends StatefulWidget {
  @override
  _PresentationViewState createState() => _PresentationViewState();
}

class _PresentationViewState extends ModularState<PresentationView, PresentationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color_Scheme.primaryColor,
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 70),
                  child: Image.asset("assets/images/logo.png",
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                    fit: BoxFit.fill,),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                      height: 45,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      child: RaisedButton(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        color: Color_Scheme.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        onPressed: () {
                          controller.signIn();
                        },
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
                  child: SizedBox(
                      height: 45,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      child: RaisedButton(
                        child: Text(
                          "Criar Conta",
                          style: TextStyle(
                              color: Color_Scheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        onPressed: () {
                          controller.createAccount();
                        },
                      )
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}