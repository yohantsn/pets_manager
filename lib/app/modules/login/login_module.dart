import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/modules/login/apresentacao/presentation_view.dart';
import 'package:pets_manager/app/modules/login/login/login_controller.dart';
import 'package:pets_manager/app/modules/login/login/login_view.dart';

import 'apresentacao/presentation_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => PresentationController()),
    Bind((i) => LoginController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => PresentationView()),
    ModularRouter('/signIn', child: (_, args) => LoginView()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}