import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/app/models/pets/pets_model.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';
import 'package:pets_manager/app/shared/repositories/general/list_especies.dart';
import 'package:pets_manager/app/shared/repositories/general/list_sex.dart';
import 'package:pets_manager/app/shared/repositories/pets/pet/pet_interface_repositorie.dart';


part 'cadastro_pet_controller.g.dart';

class CadastroPetController = _CadastroPetController
    with _$CadastroPetController;

abstract class _CadastroPetController with Store {
  final IPetRepositorie petRepositorie = Modular.get();
  _CadastroPetController({this.userModel}) {
    especieSelec = listEspecies.first;
    sexSelec = listSex.first;
    color_scheme = Color_Scheme(userModel: this.userModel);
  }
  @observable
  Color_Scheme color_scheme;

  @observable
  UserModel userModel;

  @observable
  var listEspecies = Especies.getEspecies();

  @observable
  var listSex = Sex.getListSexPet();

  @observable
  String sexSelec = "";

  @observable
  bool isSexoSelec = false;

  @observable
  String especieSelec = "";

  @observable
  bool isEspecieSelec = false;

  @observable
  File file;

  @observable
  String imgFile = "";

  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  var controllerNome = new TextEditingController();

  @observable
  var controllerCor = new TextEditingController();

  @observable
  var controllerRaca = new TextEditingController();

  @observable
  var controllerMicroChip = new TextEditingController();

  @observable
  var controllerDateNasc = new TextEditingController();

  @observable
  bool isLoading = false;

  @action
  Future<void> takePicture() async {
    file = await ImagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 40);

    imgFile = file.path;
  }

  @action
  void changedEspecie(String value) {
    this.isEspecieSelec = true;
    this.especieSelec = value;
  }

  @action
  void changedSexo(String value) {
    this.isSexoSelec = true;
    this.sexSelec = value;
  }

  @action
  Future<void> showDatePicker(BuildContext context) async {
    DateTime _now = DateTime.now().toUtc();
    await DatePicker.showDatePicker(context,
        currentTime: _now,
        maxTime: DateTime(2040, 12, 31),
        minTime: DateTime(2005, 1, 1),
        locale: LocaleType.pt,
        theme: DatePickerTheme(
            backgroundColor: color_scheme.themeColor,
            doneStyle: TextStyle(
                color: Color_Scheme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            cancelStyle: TextStyle(fontSize: 16)), onConfirm: (value) {
      controllerDateNasc.text = "${value.toUtc().toLocal().day.toString()}/"
          "${value.toUtc().toLocal().month.toString()}/"
          "${value.toUtc().toLocal().year.toString()}";
    });
  }

  @action
  Future<void> savePet({BuildContext context, bool isContinued}) async {
    if (this.formKey.currentState.validate()) {
      this.isLoading = true;
      Map<String, dynamic> mapUpdate = Map<String, dynamic>();
      if (this.file == null && !isContinued) {
        this.isLoading = false;
        showDialog(context);
      } else if (this.file != null) {
        mapUpdate = await petRepositorie.uploadImagePet(uid: this.userModel.uid, imgFile: this.file);
      }
      if (mapUpdate == null || mapUpdate.containsKey("error")) {
        callSnackbar(mapUpdate["error"] ?? "Erro");
        return;
      }
      PetsModel petsModel = PetsModel(
          namePet: controllerNome.text,
          speciePet: especieSelec,
          breedPet: controllerRaca.text,
          colorPet: controllerCor.text,
          dateNascPet: controllerDateNasc.text,
          photoPet: mapUpdate["urlPic"],
          microchip: controllerMicroChip.text,
          sex: sexSelec,
          isForget: false);
      await petRepositorie.savePetCloud(uid: this.userModel.uid, petsModel: petsModel);
      this.isLoading = false;
      Modular.to.pushNamed("/home/", arguments: {"userModel" : userModel});
    }
  }

  @action
  void callSnackbar(String content) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        content,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
    return;
  }

  @action
  void showDialog(BuildContext context) {
    AlertDialog(
      content: new Text(
          "Percebemos que você não selecionou uma foto para seu Pet, essa imagem será muito importante caso seu pet fuja."),
      actions: <Widget>[
        // define os botões na base do dialogo
        FlatButton(
          child: new Text(
            "Continuar mesmo Assim",
            style: TextStyle(color: Color_Scheme.colorRed),
          ),
          onPressed: () {
            savePet(context: context, isContinued: true);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: new Text(
            "Enviar foto",
            style: TextStyle(color: Color_Scheme.primaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}