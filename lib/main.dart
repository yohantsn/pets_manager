import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/repositories/user/user_repositories.dart';
import 'package:pets_manager/views/login/apresentacao_view.dart';

void main() {

  runApp(MaterialApp(
    home: ApresentacaoScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color_Scheme.primaryColor,
        accentColor: Color_Scheme.secondaryColor,

    ),
  ));
}

