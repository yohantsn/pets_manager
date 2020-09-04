import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';
import 'package:pets_manager/views/new_account/validation_phone_view.dart';

class PhoneNumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = new MaskedTextController(mask: '(00)00000-0000');

    return Scaffold(
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
                        bottomLeft: Radius.elliptical(130,40),
                        bottomRight: Radius.elliptical(130,40)
                      )
                    ),
                    child: Image.asset(
                      "assets/images/sms.png",
                      alignment: Alignment.center,
                      width: 110,
                      height: 220,),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              prefixText: "+55  ",
                              hintText: "Seu número de telefone",
                              hintStyle: TextStyle(
                                color: Color_Scheme.primaryColor
                              ),
                            ),
                            style: TextStyle( color: Color_Scheme.primaryColor),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ValidationPhoneView(phoneNumber: controller.text,)));
                          },
                        )),
                  ),
                ],
              ),
            )
          ),
        )
    );
  }
}
