class HealthModel {
  String healthDescription;
  String healthCategory;
  String healthSubCategory;
  String healthDate;
  bool healthRecovery;

  HealthModel(
      {this.healthDescription,
        this.healthCategory,
        this.healthSubCategory,
        this.healthDate,
        this.healthRecovery});

  HealthModel.fromJson(Map<String, dynamic> json) {
    healthDescription = json['health_description'];
    healthCategory = json['health_category'];
    healthSubCategory = json['health_sub_category'];
    healthDate = json['health_date'];
    healthRecovery = json['health_recovery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['health_description'] = this.healthDescription;
    data['health_category'] = this.healthCategory;
    data['health_sub_category'] = this.healthSubCategory;
    data['health_date'] = this.healthDate;
    data['health_recovery'] = this.healthRecovery;
    return data;
  }
}