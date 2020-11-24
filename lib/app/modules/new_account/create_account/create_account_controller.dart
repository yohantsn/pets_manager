import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/pet/cadastro_pet/cadastro_pet_view.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/app/shared/core/location_manager.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositories.dart';


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
  var controller = new MaskedTextController(mask: '(00)00000-0000');

  @observable
  bool obscuredPass = true;

  @observable
  bool obscuredConfPass = true;

  @observable
  bool isLoading = false;

  @action
  Future<void> createAccount({BuildContext context}) async {
    if (formKey.currentState.validate()) {
      this.isLoading = true;
      UserModel userModel = await AuthCore().authCreateAccountEmail(
          email: controllerEmail.text, password: controllerPassword.text);
      if (userModel.errorMsg == null || userModel.errorMsg.isEmpty) {
        LocationData locationData = await LocationManager().getLocation();
        userModel.ownerName = controllerName.text;
        userModel.ownerEmail = controllerEmail.text;
        userModel.ownerPhone = controller.text;
        userModel.ownerLatitude = locationData.latitude;
        userModel.ownerLongitude = locationData.longitude;
        userModel.isPhoneVerified = false;
        userModel.isEmailVerified = false;
        userModel.ownerModeDark = false;
        userModel.ownerPicProfile = "";
        UserRepositories()
            .createProfile(userModel: userModel, uid: userModel.uid)
            .then((value) {
          this.isLoading = false;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => NewPetScreen(
                        userModel: userModel,
                      )));
        });
      } else {
        this.isLoading = false;
        callSnackbar(userModel.errorMsg);
      }
    }
  }

  @action
  void showPassword() {
    this.obscuredPass = this.obscuredPass ? false : true;
  }

  @action
  void showConfPassword() {
    this.obscuredConfPass = this.obscuredConfPass ? false : true;
  }

  @action
  void callSnackbar(String content) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        content,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
    return;
  }
}
