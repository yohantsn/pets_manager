import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/modules/login/login/login_controller.dart';

import 'login_view.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => LoginView()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}