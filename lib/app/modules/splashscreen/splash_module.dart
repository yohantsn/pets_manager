import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/modules/splashscreen/splash/splash_controller.dart';
import 'package:pets_manager/app/modules/splashscreen/splash/splash_view.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => SplashView()),
  ];

  static Inject get to => Inject<SplashModule>.of();
}