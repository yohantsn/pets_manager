import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:pets_manager/app/modules/home/home_module/home_controller.dart';


class TabHomeView extends StatelessWidget {
  final HomeController homeController;
  TabHomeView({this.homeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: MapboxMap(
        styleString: homeController.userModel.ownerModeDark ? MapboxStyles.DARK : MapboxStyles.LIGHT,
        accessToken: "pk.eyJ1IjoieW9oYW50c24iLCJhIjoiY2thcTVlejA2MDE5OTJ4bXhza3c5dHNqNSJ9.Td6Q0t6Xe-ltSxtZpFwV2w",
        initialCameraPosition: CameraPosition(target: LatLng(-25.4816272, -49.2856461),zoom: 14.0),
      ),
    );
  }
}
