class ValidationPhoneController{
  static Future<bool> isValid(String code) async{
    await Future.delayed(Duration(seconds: 5));
    return code == "1234";
  }
}