import 'package:latlong/latlong.dart';
import 'package:pets_manager/core/location_manager.dart';

class VeterinaryModel {
  String name;
  double lat;
  double lon;
  String phone;
  String address;
  String vetRespName;
  String vetRespCRMV;
  String durationAppointment;
  double rating;
  String email;
  String site;
  bool isOpen;
  int distance;
  String urlImageAvatar;
  List<int> type;
  List<OperationList> operationList;
  List<String> specialities;

  VeterinaryModel(
      {this.name,
      this.lat,
      this.lon,
      this.phone,
      this.address,
      this.vetRespName,
      this.vetRespCRMV,
      this.durationAppointment,
      this.rating,
      this.email,
      this.site,
      this.type,
      this.operationList,
      this.specialities,
      this.distance,
      this.isOpen,
      this.urlImageAvatar});

  VeterinaryModel.fromJson(Map<String, dynamic> json, LatLng _latlng) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    phone = json['phone'];
    address = json['address'];
    vetRespName = json['vetRespName'];
    vetRespCRMV = json['vetRespCRMV'];
    durationAppointment = json['durationAppointment'];
    rating = json['rating'];
    email = json['email'];
    site = json['site'];
    type = json['type'].cast<int>();
    urlImageAvatar = json["urlImageAvatar"];

    if (json['operationList'] != null) {
      operationList = new List<OperationList>();
      json['operationList'].forEach((v) {
        operationList.add(new OperationList.fromJson(v));
      });
    }

    specialities = json['specialities'].cast<String>();

    DateTime _now = DateTime.now().toLocal();
    int _dayWeekNow = DateTime.now().toLocal().weekday;
    operationList.forEach((element) {
      if (element.dayWeek == _dayWeekNow) {
        DateTime dateTimeOpen = DateTime(
            _now.year,
            _now.month,
            _now.day,
            int.parse(element.hour.open.substring(0, 2)),
            int.parse(element.hour.open.substring(3, 5)));
        DateTime dateTimeClose = DateTime(
            _now.year,
            _now.month,
            _now.day,
            int.parse(element.hour.close.substring(0, 2)),
            int.parse(element.hour.close.substring(3, 5)));
        isOpen = (dateTimeOpen.isBefore(_now) && !dateTimeClose.isAfter(_now));
        return;
      }
    });

    final Distance _distance = new Distance();
    distance = _distance.distance(_latlng, LatLng(lat, lon)).round();
    if(distance > 1000) {
      distance = _distance.as(LengthUnit.Kilometer,
          _latlng, LatLng(lat, lon)).round();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['vetRespName'] = this.vetRespName;
    data['vetRespCRMV'] = this.vetRespCRMV;
    data['durationAppointment'] = this.durationAppointment;
    data['rating'] = this.rating;
    data['email'] = this.email;
    data['site'] = this.site;
    data['type'] = this.type;
    data["urlImageAvatar"] = this.urlImageAvatar;
    if (this.operationList != null) {
      data['operationList'] =
          this.operationList.map((v) => v.toJson()).toList();
    }
    data['specialities'] = this.specialities;
    return data;
  }
}

class OperationList {
  int dayWeek;
  Hour hour;

  OperationList({this.dayWeek, this.hour});

  OperationList.fromJson(Map<String, dynamic> json) {
    dayWeek = json['dayWeek'];
    hour = json['hour'] != null ? new Hour.fromJson(json['hour']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dayWeek'] = this.dayWeek;
    if (this.hour != null) {
      data['hour'] = this.hour.toJson();
    }
    return data;
  }
}

class Hour {
  String open;
  String close;

  Hour({this.open, this.close});

  Hour.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['close'] = this.close;
    return data;
  }
}
