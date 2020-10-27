import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/repositories/user/user_repositories.dart';
import 'package:pets_manager/views/new_account/phone_number_view.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = _CreateAccountController
    with _$CreateAccountController;

abstract class _CreateAccountController with Store {
  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  var controllerEmail = new TextEditingController();

  @observable
  var controllerPassword = new TextEditingController();

  @observable
  var controllerConfPassword = new TextEditingController();

  @observable
  var controllerName = new TextEditingController();

  @observable
  bool obscuredPass = true;

  @observable
  bool obscuredConfPass = true;

  @action
  Future<void> createAccount({BuildContext context}) async {
    if (formKey.currentState.validate()) {
      UserModel userModel = await AuthCore().authCreateAccountEmail(
          email: controllerEmail.text, password: controllerPassword.text);
      if (userModel.errorMsg == null || userModel.errorMsg.isEmpty) {
        userModel.ownerName = controllerName.text;
        userModel.ownerEmail = controllerEmail.text;
        UserRepositories()
            .createProfile(userModel: userModel, uid: userModel.uid)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PhoneNumberView(userModel: userModel,)));
        });
      }else{
        callSnackbar(userModel.errorMsg);
      }
    }
  }

  @action
  void showPassword(){
    this.obscuredPass = this.obscuredPass ? false : true;
  }

  @action
  void showConfPassword(){
    this.obscuredConfPass = this.obscuredConfPass ? false : true;
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
