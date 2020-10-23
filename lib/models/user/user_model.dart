class UserModel {
  String ownerName;
  String ownerPhone;
  String ownerEmail;
  double ownerLatitude;
  double ownerLongitude;
  String ownerPicProfile;
  bool ownerModeDark;
  bool isEmailVerified;
  String errorMsg;

  UserModel(
      {this.ownerName,
        this.ownerPhone,
        this.ownerEmail,
        this.ownerLatitude,
        this.ownerLongitude,
        this.ownerPicProfile,
        this.ownerModeDark,
      this.isEmailVerified,
      this.errorMsg});

  UserModel.fromJson(Map<String, dynamic> json) {
    ownerName = json['owner_name'];
    ownerPhone = json['owner_phone'];
    ownerEmail = json['owner_email'];
    ownerLatitude = json['owner_latitude'];
    ownerLongitude = json['owner_longitude'];
    ownerPicProfile = json['owner_pic_profile'];
    isEmailVerified = json['isEmailVerified'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner_name'] = this.ownerName;
    data['owner_phone'] = this.ownerPhone;
    data['owner_email'] = this.ownerEmail;
    data['owner_latitude'] = this.ownerLatitude;
    data['owner_longitude'] = this.ownerLongitude;
    data['owner_pic_profile'] = this.ownerPicProfile;
    data['owner_mode_dark'] = this.ownerModeDark;
    data['isEmailVerified'] = this.isEmailVerified;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}