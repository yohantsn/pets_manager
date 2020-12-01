import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/app_widget.dart';
import 'package:pets_manager/app/modules/home/home_module.dart';
import 'package:pets_manager/app/modules/new_account/new_account_module.dart';
import 'package:pets_manager/app/modules/splashscreen/splash_module.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_interface.dart';
import 'package:pets_manager/app/shared/location/location_geo_data.dart';
import 'package:pets_manager/app/shared/location/location_interface_data.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_firebase_repositories.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_interface_repositorie.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet_forget/pets_forget_interface.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet_forget/pets_forget_repositorie.dart';
import 'package:pets_manager/app/shared/repositories/places/pet_place_firebase.dart';
import 'package:pets_manager/app/shared/repositories/places/pet_place_interface.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositorie_interface.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositories_firebase.dart';

import 'modules/login/login_module.dart';



class AppModule extends MainModule{

  @override
  List<Bind> get binds => [
    Bind<ILocationData>((i) => LocationGeoData()),
    Bind<IPetForget>((i) => PetForgetFirebase()),
    Bind<IPetRepositorie>((i) => PetFirebaseRepositories()),
    Bind<IPetPlace>((i) => PetPlaceFirebase()),
    Bind<IUser>((i) => UserFirebase()),
    Bind<IAuth>((i) => AuthFirebase()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', module: SplashModule()),
    ModularRouter('/home', module: HomeModule()),
    ModularRouter('/login', module: LoginModule()),
    ModularRouter('/create_account', module: NewAccountModule()),
  ];

}