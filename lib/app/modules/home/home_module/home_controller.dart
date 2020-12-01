import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';
import 'package:pets_manager/app/shared/core/firebase/auth/auth_interface.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_interface_repositorie.dart';
import 'package:pets_manager/app/shared/repositories/user/user_repositorie_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController
    with _$HomeController;

abstract class _HomeController with Store{
  final IPetRepositorie petRepositorie = Modular.get();
  final IUser userFirebase = Modular.get();
  final IAuth authFirebase = Modular.get();
  _HomeController({this.userModel}) {
    getUserData();
  }

  @observable
  UserModel userModel;

  @observable
  Color_Scheme color_Scheme;

  @observable
  List<PetsModel> listPetsModels = List<PetsModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> takePicture() async{
    ImagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 40).then((value) {
    });
  }

  @action
  Future<void> getListPet() async{
   this.isLoading = true;
   this.listPetsModels = await petRepositorie.getListPets(uid: this.userModel.uid);
   this.isLoading = false;
  }

  @action
  Future<void> getUserData() async {
    this.isLoading =  true;
    if(this.userModel == null) {
      String uid = authFirebase.getUid();
      this.userModel = await  userFirebase.getUserModel(uid: uid);
    }
    color_Scheme = Color_Scheme(userModel: this.userModel);
    this.isLoading = false;
  }

}