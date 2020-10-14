import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets/vaccine_model.dart';
import 'package:pets_manager/repositories/pets/vaccine_repositorie.dart';

part 'new_vaccine_controller.g.dart';

class NewVaccineController = _NewVaccineControllerStore
    with _$NewVaccineController;

abstract class _NewVaccineControllerStore with Store {
  _NewVaccineControllerStore({@required this.color_scheme});

  @observable
  Color_Scheme color_scheme;

  @observable
  bool isLoading = false;

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  var controllerDateApl = new TextEditingController();

  @observable
  var controllerDateRet = new TextEditingController();

  @observable
  var controllerName = new TextEditingController();

  @observable
  var controllerMaker = new TextEditingController();

  @observable
  var controllerVet = new TextEditingController();

  @observable
  var controllerCRM = new TextEditingController();

  @observable
  var controllerCRMUF = new TextEditingController();

  @action
  void saveVaccine() {
    if (formKey.currentState.validate()) {
      this.isLoading = true;
      VaccineModel vaccineModel = VaccineModel(
          nameVaccine: this.controllerName.text.toString(),
          makerVaccine: this.controllerMaker.text.toString(),
          dateApplication: this.controllerDateApl.text.toString(),
          dateReturn: this.controllerDateRet.text.toString(),
          nameVeterinary: this.controllerVet.text.toString(),
          numCrmVeterinary: this.controllerCRM.text.toString(),
          ufCrmVeterinary: this.controllerCRMUF.text.toString());
      print(vaccineModel.toJson().toString());
      VaccineRepositorie().addVaccine(vaccineModel).then((_) {
        this.isLoading = false;
      });
    }
  }

  @action
  Future<void> showDatePicker(BuildContext context, bool isApplication) async {
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
      isApplication
          ? controllerDateApl.text =
              "${value.toUtc().toLocal().day.toString()}/"
                  "${value.toUtc().toLocal().month.toString()}/"
                  "${value.toUtc().toLocal().year.toString()}"
          : controllerDateRet.text =
              "${value.toUtc().toLocal().day.toString()}/"
                  "${value.toUtc().toLocal().month.toString()}/"
                  "${value.toUtc().toLocal().year.toString()}";
    });
  }
}
