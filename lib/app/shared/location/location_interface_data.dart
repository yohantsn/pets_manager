import 'package:location/location.dart';

abstract class ILocationData{

  Future<LocationData> getLocation();
  Future<String> getAddress({double lat, double lon});
}