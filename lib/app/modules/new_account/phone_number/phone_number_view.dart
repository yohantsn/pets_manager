import 'package:flutter/material.dart';
import 'package:pets_manager/app/modules/new_account/phone_number/phone_number_controller.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


class PhoneNumberView extends StatelessWidget {
  PhoneNumberView({this.userModel});
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    PhoneNumberController _phoneNumberController = PhoneNumberController();

    return Scaffold(
        key: _phoneNumberController.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color_Scheme.primaryColor,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color_Scheme.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(130, 40),
                          bottomRight: Radius.elliptical(130, 40))),
                  child: Image.asset(
                    "assets/images/sms.png",
                    alignment: Alignment.center,
                    width: 110,
                    height: 220,
                  ),
                ),
                Form(
                  key: _phoneNumberController.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: TextFormField(
                          controller: _phoneNumberController.controller,
                          decoration: InputDecoration(
                            prefixText: "+55  ",
                            hintText: "Seu número de telefone",
                            hintStyle:
                                TextStyle(color: Color_Scheme.primaryColor),
                          ),
                          style: TextStyle(color: Color_Scheme.primaryColor),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: RaisedButton(
                        child: Text(
                          "Cadastrar",
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
                          _phoneNumberController.saveNumberPhone(
                              userModel: this.userModel, context: context);
                        },
                      )),
                ),
              ],
            ),
          )),
        ));
  }
}
