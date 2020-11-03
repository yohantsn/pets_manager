import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/firebase/auth/auth_core.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerController with _$SplashController;

abstract class _SplashControllerController extends AuthCore with Store {
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
    this.uid = getUid();
    this.isLoading = false;
  }
}
