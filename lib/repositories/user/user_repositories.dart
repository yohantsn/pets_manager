import 'package:pets_manager/models/user/user_model.dart';

class UserRepositories{
  Future<UserModel> getUserModel() async {
    Map<String, dynamic> _mapUser = {
      "owner_name": "Joseph Andrews",
      "owner_phone" : "+5541997820585",
      "owner_email" : "josephand@hotmail.com",
      "owner_latitude" : -25.4816272,
      "owner_longitude" : -49.2856461,
      "owner_pic_profile" : "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "owner_mode_dark" : false
    };
    UserModel userModel = UserModel.fromJson(_mapUser);
    return userModel;
  }
}