import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'app/modules/splashscreen/splash/splash_view.dart';
import 'app/shared/core/colors_scheme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MaterialApp(
    home: SplashView(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color_Scheme.primaryColor,
        accentColor: Color_Scheme.secondaryColor,

    ),
  ));
}

