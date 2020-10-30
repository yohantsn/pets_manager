import 'package:flutter/material.dart';
import 'package:pets_manager/controllers/splash/splash_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/home_view.dart';
import 'package:pets_manager/views/login/apresentacao_view.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  SplashController _splashController = SplashController();

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        backgroundColor: Color_Scheme.primaryColor,
        seconds: _splashController.seconds,

        navigateAfterSeconds: _splashController.uid.isEmpty
            ? ApresentacaoScreen()
            : HomeView(userModel: _splashController.userModel, splashController: _splashController,),);
  }
}
