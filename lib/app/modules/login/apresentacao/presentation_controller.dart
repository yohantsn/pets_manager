import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'presentation_controller.g.dart';

class PresentationController = _PresentationController
    with _$PresentationController;

abstract class _PresentationController with Store {

  @action
  void createAccount(){
    Modular.to.pushNamed("/create_account/");
  }


  @action
  void signIn(){
    Modular.to.pushNamed("/login/signIn");
  }
}