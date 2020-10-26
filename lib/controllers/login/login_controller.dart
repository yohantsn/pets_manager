import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/views/home_view.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerStore with _$LoginController;

abstract class _LoginControllerStore with Store {
  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  var controllerEmail = new TextEditingController();

  @observable
  var controllerPassword = new TextEditingController();

  @action
  void signIn({BuildContext context}) {
    if (formKey.currentState.validate()) {
      String password = controllerPassword.text;
      String email = controllerEmail.text;

      UserModel userModel;
      AuthCore()
          .authSignAccountEmail(email: email, password: password)
          .then((value) {
        if (value.errorMsg.isEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeView(
                        userModel: userModel,
                      )));
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
