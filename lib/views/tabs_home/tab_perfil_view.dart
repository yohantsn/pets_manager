

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_manager/core/colors_scheme.dart';

class TabPerfilView extends StatefulWidget {
  @override
  _TabPerfilViewState createState() => _TabPerfilViewState();
}

class _TabPerfilViewState extends State<TabPerfilView> {
  File _file;
  String _imgFile = "";

  Future<void> _takePicture()async{
    _file = await ImagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 40);
    setState(() {
      _imgFile = _file.path;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[

                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 15, top: 15),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: _imgFile.isNotEmpty
                                  ? FileImage(File(_imgFile))
                                  : AssetImage("assets/images/perfil_user.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      onTap: () {
                        _takePicture();
                      },
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.camera_alt,
                          color: Color_Scheme.primaryColor,
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _takePicture();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
