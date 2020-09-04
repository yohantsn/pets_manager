import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/views/pet/list_pet_view.dart';
import 'package:pets_manager/views/tabs_home/tab_home_view.dart';
import 'package:pets_manager/views/tabs_home/tab_perfil_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _nameUser = "Yohan";
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color_Scheme.darkColor,
      bottomNavigationBar: BottomNavyBar(
      backgroundColor: Color_Scheme.darkColor,
        onItemSelected: onTabTapped, // new
        selectedIndex: _currentIndex,
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.person_outline, color:  Color_Scheme.primaryColor,),
              title: Text("Minha Conta"),
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
          ? TabHomeView()
          : _currentIndex == 2
          ? PetListView()
          : TabPerfilView()
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

