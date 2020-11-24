import 'package:flutter/material.dart';
import 'package:pets_manager/app/models/user/user_model.dart';


class Color_Scheme{

  final UserModel userModel;

  Color_Scheme({this.userModel});

  Color get primaryColorTheme{
    Color _color;
    userModel.ownerModeDark ?
    _color  = Color(0xFF006851)
    :_color = Color(0xFF00d1a2);
    return _color;
  }
  Color get secondaryColorTheme{
    Color _color;
    userModel.ownerModeDark
    ? _color = Color(0xFF2e3332)
    : _color = Color(0xFF00ffcd);
    return _color;
  }

  Color get lightColorTheme{
    Color _color;
    userModel.ownerModeDark
        ? _color = Color(0xFF212121)
        : _color = Color(0xFFf2fffc);
    return _color;
  }

  static Color get secondaryLigthColor{
    return Color(0xFFe6fffa);
  }

  static Color get primaryColor{
    return Color(0xFF00d1a2);
  }

  static Color get secondaryColor{
    return Color(0xFF00ffcd);
  }
  static Color get colorRed{
    return Color(0xFFff9e8a);
  }
  Color get themeColor{
     Color _color;
    userModel.ownerModeDark
    ? _color = Colors.black45
    :_color = Colors.white;
    return _color;
  }
  static Color get darkColor{

  }
}