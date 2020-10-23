import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets_manager/models/user/user_model.dart';

class UserRepositories {
  UserRepositories() {
    this.fire = FirebaseFirestore.instance;
  }

  FirebaseFirestore fire;

  Future<UserModel> getUserModel({String uid}) async {
    QuerySnapshot querySnapshot = await this
        .fire
        .collection("users_data")
        .doc(uid)
        .collection("profile")
        .get();

    QueryDocumentSnapshot queryDocumentSnapshot = querySnapshot.docs.first;
    UserModel userModel = UserModel.fromJson( queryDocumentSnapshot.data());
    return userModel;
  }

  Future<void> createProfile({String uid, UserModel userModel}) async{
    await this
        .fire
        .collection("users_data")
        .doc(uid)
        .collection("profile")
        .add(userModel.toJson());
  }

  
}
