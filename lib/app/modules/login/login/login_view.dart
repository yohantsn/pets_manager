import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pets_manager/app/modules/login/login/login_controller.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


class LoginView extends StatelessWidget {
  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginController.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Login",style: TextStyle(
            color: Color_Scheme.primaryColor, fontSize: 18),),
        centerTitle: true,

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: loginController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Image.asset("assets/images/logo.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fill,),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Observer(
                    builder: (_)=>
                        TextFormField(
                          controller: loginController.controllerEmail,
                          decoration: InputDecoration(
                            icon: Icon(Icons.alternate_email, color: Color_Scheme.primaryColor,),
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color_Scheme.primaryColor),
                            ),
                          ),
                        ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
                  child: Observer(
                    builder: (_) => TextFormField(
                      controller: loginController.controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline, color: Color_Scheme.primaryColor,),
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Color_Scheme.primaryColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color_Scheme.primaryColor),
                        ),
                      ),
                    ),
                  )
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
                        color: Color_Scheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        onPressed: (){
                          loginController.signIn();
                        },
                      )
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
