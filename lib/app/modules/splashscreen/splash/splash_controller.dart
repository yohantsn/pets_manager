import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_interface.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositorie_interface.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerController with _$SplashController;

abstract class _SplashControllerController  with Store {
  final IAuth authFirebase = Modular.get();
  final IUser userFirebase = Modular.get();
  _SplashControllerController() {
    this.isLoading = true;
    getUser();
  }

  @observable
  bool isLoading = false;

  @observable
  String uid = "";

  @observable
  int seconds = 3;

  @action
  Future<void> getUser() async {
    this.uid = authFirebase.getUid();
    await Future.delayed(Duration(seconds: 3));
    if(uid.isNotEmpty){
      UserModel userModel = await userFirebase.getUserModel(uid: this.uid);
      Modular.to.pushNamed("/home/", arguments: {"userModel": userModel});
    }else{
      Modular.to.pushNamed("/login/");
    }
    this.isLoading = false;
  }
}
