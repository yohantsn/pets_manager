import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class TabHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: MapboxMap(
        styleString: MapboxStyles.DARK,
        accessToken: "pk.eyJ1IjoieW9oYW50c24iLCJhIjoiY2thcTVlejA2MDE5OTJ4bXhza3c5dHNqNSJ9.Td6Q0t6Xe-ltSxtZpFwV2w",
        initialCameraPosition: CameraPosition(target: LatLng(-25.4816272, -49.2856461),zoom: 14.0),

      ),
    );
  }
}
