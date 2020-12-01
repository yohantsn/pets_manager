import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_manager/app/modules/new_account/create_account/create_account_controller.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';

class CreateAccountView extends StatefulWidget {
  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState
    extends ModularState<CreateAccountView, CreateAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Criar Conta",
            style: TextStyle(color: Color_Scheme.primaryColor, fontSize: 18),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Observer(
          builder: (_) => controller.isLoading
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lotties/loading.json',
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width * 0.50,
                        alignment: Alignment.center,
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Aguarde, salvando dados ...",
                        style: TextStyle(
                            color: Color_Scheme.secondaryLigthColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ))
              : SingleChildScrollView(
                  child: SafeArea(
                  child: Form(
                    key: controller.formKey,
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
                            controller: controller.controllerName,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Color_Scheme.primaryColor,
                              ),
                              labelText: "Nome",
                              labelStyle:
                                  TextStyle(color: Color_Scheme.primaryColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color_Scheme.primaryColor),
                              ),
                            ),
                            style: TextStyle(color: Color_Scheme.primaryColor),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Nome é obrigatório.";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: TextFormField(
                            controller: controller.controller,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: Color_Scheme.primaryColor,
                              ),
                              prefixText: "+55  ",
                              prefixStyle:
                                  TextStyle(color: Color_Scheme.primaryColor),
                              labelText: "Seu número de celular",
                              labelStyle:
                                  TextStyle(color: Color_Scheme.primaryColor),
                            ),
                            style: TextStyle(color: Color_Scheme.primaryColor),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Celular é obrigatório.";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: TextFormField(
                            controller:
                            controller.controllerEmail,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.alternate_email,
                                color: Color_Scheme.primaryColor,
                              ),
                              labelText: "E-mail",
                              labelStyle:
                                  TextStyle(color: Color_Scheme.primaryColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color_Scheme.primaryColor),
                              ),
                            ),
                            style: TextStyle(color: Color_Scheme.primaryColor),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "E-mail é obrigatório.";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Observer(
                                builder: (_) => TextFormField(
                                  controller: controller
                                      .controllerPassword,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Color_Scheme.primaryColor,
                                    ),
                                    labelText: "Senha",
                                    labelStyle: TextStyle(
                                        color: Color_Scheme.primaryColor),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color_Scheme.primaryColor),
                                    ),
                                  ),
                                  obscureText:
                                  controller.obscuredPass,
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Senha é obrigatório.";
                                    }
                                  },
                                ),
                              )),
                              IconButton(
                                  icon: Lottie.asset('assets/lotties/eyes.json',
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill),
                                  onPressed: () {
                                    controller..showPassword();
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Observer(
                                builder: (_) => TextFormField(
                                  controller: controller
                                      .controllerConfPassword,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Color_Scheme.primaryColor,
                                    ),
                                    labelText: "Confirmar senha",
                                    labelStyle: TextStyle(
                                        color: Color_Scheme.primaryColor),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color_Scheme.primaryColor),
                                    ),
                                  ),
                                  obscureText:
                                  controller.obscuredConfPass,
                                  style: TextStyle(
                                      color: Color_Scheme.primaryColor),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Confirmação da senha é obrigatório.";
                                    } else if (value !=
                                        controller
                                            .controllerPassword.text) {
                                      return "Senha e a confirmação não conferem";
                                    }
                                  },
                                ),
                              )),
                              IconButton(
                                  icon: Lottie.asset('assets/lotties/eyes.json',
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill),
                                  onPressed: () {
                                    controller.showConfPassword();
                                  }),
                            ],
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
                                  controller.createAccount(
                                      context: context);
                                },
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                            child: Text(
                              "Ao continuar, você estará de acordo com nossos termos de uso.",
                              style: TextStyle(
                                color: Color_Scheme.primaryColor,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                            )),
                      ],
                    ),
                  ),
                )),
        ));
  }
}

