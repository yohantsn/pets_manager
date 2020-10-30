import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/firebase/auth/auth_core.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/repositories/user/user_repositories.dart';
import 'package:pets_manager/views/home_view.dart';
import 'package:pets_manager/views/login/apresentacao_view.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerController
    with _$SplashController;

abstract class _SplashControllerController extends AuthCore with Store {
  _SplashControllerController(){
    this.isLoading = true;
    getUser();
  }

  @observable
  bool isLoading = false;

  @observable
  UserModel userModel;

  @observable
  String uid = "";

  @observable
  int seconds = 10;


  @action
  Future<void> getUser() async{
    this.uid = getUid();
    if(this.uid != null && this.uid.isNotEmpty){
      this.userModel = await UserRepositories().getUserModel(uid: this.uid);
      this.isLoading = false;
    }
  }

}
