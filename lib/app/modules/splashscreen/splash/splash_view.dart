import 'package:flutter/material.dart';
import 'package:pets_manager/app/modules/login/apresentacao/apresentacao_view.dart';
import 'package:pets_manager/app/modules/splashscreen/splash/splash_controller.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../home/home_module/home_view.dart';

class SplashView extends StatelessWidget {
  SplashController _splashController = SplashController();

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        backgroundColor: Color_Scheme.primaryColor,
        seconds: _splashController.seconds,

        navigateAfterSeconds: _splashController.uid.isEmpty
            ? ApresentacaoScreen()
            : HomeView(userModel: null),);
  }
}
