import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/login/apresentacao_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: ApresentacaoScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color_Scheme.primaryColor,
        accentColor: Color_Scheme.secondaryColor,

    ),
  ));
}

