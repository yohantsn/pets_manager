import 'package:flutter/material.dart';
import 'package:pets_manager/controllers/home/home_controller.dart';
import 'package:pets_manager/controllers/pet/pet_contoller.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pets/pets_model.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';
import 'package:pets_manager/views/pet/pet_general_view.dart';

class PetListView extends StatefulWidget {
  final HomeController homeController;
  final bool darkMode;
  PetListView({this.homeController, this.darkMode});

  @override
  _PetListViewState createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {
  List<PetsModel> _list = List<PetsModel>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PetController().getListPet().then((value) {
      setState(() {
        isLoading = false;
        _list = value;
        print(_list);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.homeController.color_Scheme.themeColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color_Scheme.primaryColor,
        child: Icon(Icons.add,
            color: widget.homeController.color_Scheme.themeColor),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewPetScreen()));
        },
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _list == null
              ? Container()
              : ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return _petCard(context, index);
                  },
                ),
    );
  }

  Widget _petCard(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Card(
          color: widget.homeController.color_Scheme.lightColorTheme,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: widget.homeController.color_Scheme.lightColorTheme,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage("${_list[index].photoPet}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${_list[index].namePet}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color_Scheme.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${_list[index].speciePet} / ${_list[index].breedPet}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color_Scheme.primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${_list[index].agePet} / ${_list[index].colorPet}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color_Scheme.primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PetGeneralView(
                      petsModel: _list[index],
                      color_scheme: widget.homeController.color_Scheme,
                      darkMode: widget.darkMode,
                    )));
      },
    );
  }
}
