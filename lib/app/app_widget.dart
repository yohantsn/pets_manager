import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set your initial route
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color_Scheme.primaryColor,
          accentColor: Color_Scheme.secondaryColor,
    ));
  }
}