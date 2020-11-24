import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets_manager/app/models/user/user_model.dart';


 class UserRepositories {
  UserRepositories() {
    this.fire = FirebaseFirestore.instance;
  }

  FirebaseFirestore fire;
  QuerySnapshot querySnapshot;

  Future<UserModel> getUserModel({String uid}) async {
    querySnapshot = await this
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

  Future<void> updateProfile({String uid, UserModel userModel}) async{
    getUserModel(uid: uid);
    await this
        .fire
        .collection("users_data")
        .doc(uid)
        .collection("profile")
        .doc(querySnapshot.docs.first.id)
        .set(userModel.toJson());
  }
  
}
