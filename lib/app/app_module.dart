import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/app_widget.dart';
import 'package:pets_manager/app/modules/home/home_module.dart';
import 'package:pets_manager/app/shared/core/location_geo_data.dart';
import 'package:pets_manager/app/shared/location/location_interface_data.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_firebase_repositories.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_interface_repositorie.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet_forget/pets_forget_interface.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet_forget/pets_forget_repositorie.dart';

import 'modules/splashscreen/splash/splash_view.dart';


class AppModule extends MainModule{

  @override
  List<Bind> get binds => [
    Bind<ILocationData>((i) => LocationGeoData()),
    Bind<IPetForget>((i) => PetForgetFirebase()),
    Bind<IPetRepositorie>((i) => PetFirebaseRepositories()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => SplashView()),
    ModularRouter('/home', module: HomeModule()),
  ];

}