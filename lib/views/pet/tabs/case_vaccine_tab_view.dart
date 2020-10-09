import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets/pets_model.dart';

class CaseVaccineTabView extends StatelessWidget {
  final Color_Scheme color_scheme;
  final PetsModel petsModel;
  CaseVaccineTabView({this.color_scheme, this.petsModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.color_scheme.themeColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10, top: 30),
                    height: 160,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: this.petsModel.photoPet.isNotEmpty
                              ? NetworkImage(this.petsModel.photoPet)
                              : AssetImage("assets/images/cao.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Carteira de Vacinação",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(
                            color: Color_Scheme.primaryColor,
                            fontSize: 44,
                            fontFamily: "Arabella",
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color_scheme.lightColorTheme,
                            border: Border.all(
                              color: Color_Scheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              text: "Nome: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color_Scheme.primaryColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                    "${this.petsModel.namePet}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color_scheme.lightColorTheme,
                            border: Border.all(
                              color: Color_Scheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              text: "Sexo: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color_Scheme.primaryColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                    "${this.petsModel.sex == "F" ? "Fêmea" : "Macho"}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                              ]),
                        ),
                      ),
                    ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    color: color_scheme.lightColorTheme,
                    border: Border.all(
                      color: Color_Scheme.primaryColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                      text: "Data de Nascimento: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color_Scheme.primaryColor),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            "${this.petsModel.dateNascPet}",
                            style:
                            TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                      ]),
                ),
              ),
            ),
           Padding(
             padding: EdgeInsets.all(10),
             child:  Row(
               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                   child: Container(
                     decoration: BoxDecoration(
                         color: color_scheme.lightColorTheme,
                         border: Border.all(
                           color: Color_Scheme.primaryColor,
                         ),
                         borderRadius: BorderRadius.all(Radius.circular(20))
                     ),
                     padding: EdgeInsets.all(10),
                     child: RichText(
                       text: TextSpan(
                           text: "Espécie: ",
                           style: TextStyle(
                               fontWeight: FontWeight.w500,
                               color: Color_Scheme.primaryColor),
                           children: <TextSpan>[
                             TextSpan(
                                 text:
                                 "${this.petsModel.speciePet}",
                                 style:
                                 TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                           ]),
                     ),
                   ),
                 ),
                 Expanded(
                   child: Padding(
                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                     child: Container(
                       decoration: BoxDecoration(
                           color: color_scheme.lightColorTheme,
                           border: Border.all(
                             color: Color_Scheme.primaryColor,
                           ),
                           borderRadius: BorderRadius.all(Radius.circular(20))
                       ),

                       padding: EdgeInsets.all(10),
                       child: RichText(
                         text: TextSpan(
                             text: "Raça do Pet: ",
                             style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 color: Color_Scheme.primaryColor),
                             children: <TextSpan>[
                               TextSpan(
                                   text:
                                   "${this.petsModel.breedPet}",
                                   style:
                                   TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                             ]),
                       ),
                     ),
                   ),
                 )
               ],
             ),
           ),
            Padding(
              padding: EdgeInsets.all(10),
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: color_scheme.lightColorTheme,
                          border: Border.all(
                            color: Color_Scheme.primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      padding: EdgeInsets.all(10),
                      child: RichText(
                        text: TextSpan(
                            text: "Cor: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color_Scheme.primaryColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                  "${this.petsModel.colorPet}",
                                  style:
                                  TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color_scheme.lightColorTheme,
                            border: Border.all(
                              color: Color_Scheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              text: "Microchip: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color_Scheme.primaryColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                    "${this.petsModel.microchip}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arabella", fontSize: 28, color: Color_Scheme.primaryColor)),
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
