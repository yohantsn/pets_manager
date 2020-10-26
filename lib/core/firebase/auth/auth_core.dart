import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/repositories/user/user_repositories.dart';

class AuthCore {
  FirebaseAuth auth;
  UserRepositories userRepositories;
  AuthCore() {
    this.auth = FirebaseAuth.instance;
  }

  UserModel authCreateAccountEmail(
      {@required String email, @required String password}) {
    UserModel user;
    try {
      this
          .auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        user = UserModel(
            ownerEmail: value.user.email,
            ownerName: value.user.displayName,
            ownerPhone: value.user.photoURL,
            ownerPicProfile: value.user.photoURL,
            ownerModeDark: false,
            uid: value.user.uid);
        return user;
      });
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        user = UserModel(
            errorMsg:
                "A senha é muito fraca, tente informar letras e números.");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        user = UserModel(errorMsg: "Email ja cadastrado.");
        print('The account already exists for that email.');
      }
      return user;
    } catch (e) {
      user = UserModel(
          errorMsg:
              "Servidor feio!!! Desculpe tivemos um erro inesperado, por favor, tente novamente.");
      log(e.toString());
      return user;
    }
  }

  Future<UserModel> authSignAccountEmail (
      {@required String email, @required String password}) async{
    UserModel user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = await UserRepositories().getUserModel(uid: userCredential.user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        user = UserModel(errorMsg: "Usuario não encontrado.");
        print('No user found for that email.');
        return user;
      } else if (e.code == 'wrong-password') {
        user = UserModel(errorMsg: "Usuário ou senhas incorretos.");
        print('Usuário ou senhas incorretos');
        return user;
      } else {
        user = UserModel(errorMsg: "Usuário ou senhas incorretos.");
        print('Usuário ou senhas incorretos');
        return user;
      }

    }
  }

  void sendEmailVerification() {
    auth.currentUser.sendEmailVerification().then((value) {
      return;
    });
  }

  Future<UserModel> validateCode({@required String code}) async {
    UserModel user;
    try {
      await auth.checkActionCode(code);
      await auth.applyActionCode(code);
      auth.currentUser.reload();
      userRepositories
          .getUserModel(uid: auth.currentUser.uid.toString())
          .then((value) {
        user = value;
        user.isEmailVerified = auth.currentUser.emailVerified;
        return user;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-action-code') {
        user = UserModel(errorMsg: "Usuário ou senhas incorretos.");
        print('The code is invalid.');
      }
      return user;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool islogged() {
    return auth.currentUser.uid.isNotEmpty;
  }
}
