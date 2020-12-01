import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_interface.dart';


part 'login_controller.g.dart';

class LoginController = _LoginControllerStore with _$LoginController;

abstract class _LoginControllerStore with Store {
  final IAuth authFirebase = Modular.get();
  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  var controllerEmail = new TextEditingController();

  @observable
  var controllerPassword = new TextEditingController();

  @action
  void signIn() {
    if (formKey.currentState.validate()) {
      String password = controllerPassword.text;
      String email = controllerEmail.text;

      UserModel userModel;
      authFirebase.authSignAccountEmail(email: email, password: password)
          .then((value) {
        if (value.errorMsg.isEmpty) {
          Modular.to.pushNamed("/home/", arguments: {"userModel" : userModel});
        } else {
          callSnackbar(value.errorMsg);
        }
      });
    }
  }

  @action
  void callSnackbar(String content) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(content, style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
    return;
  }
}
