class VaccineModel {
  String nameVaccine;
  String makerVaccine;
  String dateApplication;
  String dateReturn;
  String photoLabel;
  String nameVeterinary;
  String numCrmVeterinary;
  String ufCrmVeterinary;

  VaccineModel(
      {this.nameVaccine,
        this.makerVaccine,
        this.dateApplication,
        this.dateReturn,
        this.photoLabel,
        this.nameVeterinary,
        this.numCrmVeterinary,
        this.ufCrmVeterinary});

  VaccineModel.fromJson(Map<String, dynamic> json) {
    nameVaccine = json['name_vaccine'];
    makerVaccine = json['maker_vaccine'];
    dateApplication = json['date_application'];
    dateReturn = json['date_return'];
    photoLabel = json['photo_label'];
    nameVeterinary = json['name_veterinary'];
    numCrmVeterinary = json['num_crm_veterinary'];
    ufCrmVeterinary = json['uf_crm_veterinary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_vaccine'] = this.nameVaccine;
    data['maker_vaccine'] = this.makerVaccine;
    data['date_application'] = this.dateApplication;
    data['date_return'] = this.dateReturn;
    data['photo_label'] = this.photoLabel;
    data['name_veterinary'] = this.nameVeterinary;
    data['num_crm_veterinary'] = this.numCrmVeterinary;
    data['uf_crm_veterinary'] = this.ufCrmVeterinary;
    return data;
  }
}