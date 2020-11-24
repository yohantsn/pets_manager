import 'package:flutter/material.dart';
import 'package:pets_manager/app/modules/home/home_module/home_controller.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


class TabPerfilView extends StatefulWidget {
  final HomeController homeController;
  TabPerfilView({this.homeController});

  @override
  _TabPerfilViewState createState() => _TabPerfilViewState();
}

class _TabPerfilViewState extends State<TabPerfilView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.homeController.color_Scheme.themeColor,
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
                              image: widget.homeController.userModel.ownerPicProfile.isNotEmpty
                                  ? NetworkImage(widget.homeController.userModel.ownerPicProfile)
                                  : AssetImage("assets/images/perfil_user.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {
                        widget.homeController.takePicture();
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
                        backgroundColor: widget.homeController.color_Scheme.themeColor,
                        onPressed: () {
                          widget.homeController.takePicture();
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
