import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/login/login_view.dart';
import '../new_account/create_account_view.dart';

class ApresentacaoScreen extends StatelessWidget {

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
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.fill,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
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
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
                child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
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
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
                      },
                    )
                ),
              )
            ],
          ),
        ) ,
      )
    );
  }
}
