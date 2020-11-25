import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_manager/app/modules/home/home_module/home_controller.dart';
import 'package:pets_manager/app/modules/home/home_module/home_view.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(userModel: i.args.data["userModel"])),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => HomeView()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}