import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/modules/new_account/create_account/create_account_controller.dart';
import 'package:pets_manager/app/modules/new_account/create_account/create_account_view.dart';

class NewAccountModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CreateAccountController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => CreateAccountView()),
  ];

  static Inject get to => Inject<NewAccountModule>.of();
}