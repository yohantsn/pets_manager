import 'package:pets_manager/app/models/user/user_model.dart';

abstract class IUser{
  Future<UserModel> getUserModel({String uid});
  Future<void> createProfile({String uid, UserModel userModel});
  Future<void> updateProfile({String uid, UserModel userModel});
}