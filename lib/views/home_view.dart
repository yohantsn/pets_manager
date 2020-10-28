import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:pets_manager/controllers/home/home_controller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/user/user_model.dart';
import 'package:pets_manager/views/pet/list_pet_view.dart';
import 'package:pets_manager/views/tabs_home/tab_home_view.dart';
import 'package:pets_manager/views/tabs_home/tab_perfil_view.dart';

class HomeView extends StatefulWidget {

  final UserModel userModel;
  HomeView({this.userModel});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 1;
  HomeController _homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController = HomeController(userModel: widget.userModel);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: _homeController.color_Scheme.themeColor,
      bottomNavigationBar: BottomNavyBar(
      backgroundColor: _homeController.color_Scheme.themeColor,
        onItemSelected: onTabTapped, // new
        selectedIndex: _currentIndex,
        items: [
          BottomNavyBarItem(
              icon: Container(padding: EdgeInsets.only(bottom: 15, top: 15),
                height: MediaQuery.of(context).size.height * 0.035,
                width: MediaQuery.of(context).size.height * 0.035,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: widget.userModel.ownerPicProfile != null && widget.userModel.ownerPicProfile.isNotEmpty
                          ? NetworkImage(widget.userModel.ownerPicProfile)
                      : AssetImage("assets/images/perfil_user.png"),
                      fit: BoxFit.cover),
                ),),
              title: Text("Olá ${widget.userModel.ownerName}"),
              activeColor: Color_Scheme.primaryColor
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.home, color: Color_Scheme.primaryColor,),
              title: Text("Home"),
              activeColor: Color_Scheme.primaryColor
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.pets, color: Color_Scheme.primaryColor,),
              title: Text("Meus Pets"),
              activeColor: Color_Scheme.primaryColor
          )
        ],
      ),
      body: _currentIndex == 1
          ? TabHomeView(homeController: _homeController,)
          : _currentIndex == 2
          ? PetListView(homeController: _homeController, darkMode: widget.userModel.ownerModeDark,)
          : TabPerfilView(homeController: _homeController,)
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

