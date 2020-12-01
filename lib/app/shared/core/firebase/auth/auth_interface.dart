import 'package:flutter/foundation.dart';
import 'package:pets_manager/app/models/user/user_model.dart';

abstract class IAuth{
  Future<UserModel> authCreateAccountEmail(
      {@required String email, @required String password});
  Future<UserModel> authSignAccountEmail(
      {@required String email, @required String password});
  void sendEmailVerification();
  Future<UserModel> validateCode({@required String code});
  Future<void> signOut();
  bool isLogged();
  String getUid();

}