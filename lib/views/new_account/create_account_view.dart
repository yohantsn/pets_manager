import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';
import 'package:pets_manager/views/new_account/phone_number_view.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Criar Conta",style: TextStyle(
            color: Color_Scheme.primaryColor, fontSize: 18),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_outline,
                      color: Color_Scheme.primaryColor,
                    ),
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: Color_Scheme.primaryColor,
                    ),
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_outline,
                      color: Color_Scheme.primaryColor,
                    ),
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_outline,
                      color: Color_Scheme.primaryColor,
                    ),
                    labelText: "Confirmar senha",
                    labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color_Scheme.primaryColor),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: RaisedButton(
                      child: Text(
                        "Criar Conta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Color_Scheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberView()));
                      },
                    )),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                  child: Text(
                    "Ao continuar, você estará de acordo com nossos termos de uso.",
                    style: TextStyle(
                      color: Color_Scheme.primaryColor, fontSize: 12,),
                    textAlign: TextAlign.justify,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
