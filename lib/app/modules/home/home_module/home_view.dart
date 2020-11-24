import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pets_manager/app/modules/home/home_module/home_controller.dart';
import 'package:pets_manager/app/models/user/user_model.dart';
import 'package:pets_manager/app/modules/home/tab_perfil/tab_perfil_view.dart';
import 'package:pets_manager/app/modules/home/tabs_home/tab_home_view.dart';
import 'package:pets_manager/app/modules/pet/list_pet/list_pet_view.dart';
import 'package:pets_manager/app/shared/core/colors_scheme.dart';


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

    return Observer(
        builder: (_) => _homeController.isLoading
        ? Scaffold(backgroundColor: Colors.white, body: Center(child: CircularProgressIndicator(),),)
        : Scaffold(
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
                        image: _homeController.userModel.ownerPicProfile != null && _homeController.userModel.ownerPicProfile.isNotEmpty
                            ? NetworkImage(widget.userModel.ownerPicProfile)
                            : AssetImage("assets/images/perfil_user.png"),
                        fit: BoxFit.cover),
                  ),),
                title: Text("Olá ${_homeController.userModel.ownerName}"),
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
            ? PetListView(homeController: _homeController, darkMode: _homeController.userModel.ownerModeDark,)
            : TabPerfilView(homeController: _homeController,)
    ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

