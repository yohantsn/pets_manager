
import 'dart:ffi';

import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class LocationManager{

  Future<LocationData> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<String> getAddress(double lat, double lon) async {
    await  Geocoder.local.findAddressesFromCoordinates(Coordinates(lat, lon)).then((value){
        print(value.first.addressLine);
        return value.first.addressLine.toString();
    });
  }
}