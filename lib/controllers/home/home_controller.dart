import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/user/user_model.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerStore
    with _$HomeController;

abstract class HomeControllerStore with Store{
  HomeControllerStore({this.userModel}){
    color_Scheme = Color_Scheme(userModel: this.userModel);
  }

  @observable
  UserModel userModel;

  @observable
  Color_Scheme color_Scheme;


  @action
  Future<void> takePicture() async{
    ImagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 40).then((value) {

    });
  }
}