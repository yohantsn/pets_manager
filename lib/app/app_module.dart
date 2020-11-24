import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/app_widget.dart';

import 'modules/splashscreen/splash/splash_view.dart';


class AppModule extends MainModule{

  @override
  List<Bind> get binds => [

  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => SplashView()),
  ];

}