import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/login/apresentacao_view.dart';

void main() {
  runApp(MaterialApp(
    home: ApresentacaoScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color_Scheme.primaryColor,
        accentColor: Color_Scheme.secondaryColor,
    )
    ,
  ));
}

