import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';

class CaseVaccineTabView extends StatelessWidget {
  final Color_Scheme color_scheme;
  CaseVaccineTabView({this.color_scheme});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.color_scheme.themeColor,
      body: Container(),
    );
  }
}
