import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/places/pet_places_model.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';

class ListVeterinariesView extends StatefulWidget {
  final PetPlacesModel petPlacesModel;
  final Color_Scheme color_scheme;

  ListVeterinariesView({@required this.petPlacesModel, this.color_scheme});
  @override
  _ListVeterinariesViewState createState() => _ListVeterinariesViewState();
}

class _ListVeterinariesViewState extends State<ListVeterinariesView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Veterinários próximos",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
            color: Color_Scheme.secondaryLigthColor
        ),
        backgroundColor: widget.color_scheme.primaryColorTheme,
        centerTitle: true,
      ),
      backgroundColor: widget.color_scheme.themeColor,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : widget.petPlacesModel.listVeterinary == null
              ? Container()
              : ListView.builder(
                  itemCount: widget.petPlacesModel.listVeterinary.length,
                  itemBuilder: (context, index) {
                    return _petCard(context, index);
                  },
                ),
    );
  }

  Widget _petCard(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color_Scheme.secondaryColor),
              borderRadius: BorderRadius.circular(10)),
          color: widget.color_scheme.lightColorTheme,
          child: Container(
            height: 160,
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
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: widget.petPlacesModel.listVeterinary[index]
                          .urlImageAvatar.isNotEmpty
                      ? Image.network(
                          "${widget.petPlacesModel.listPetShops[index].urlImageAvatar}",
                          color:
                              widget.petPlacesModel.listPetShops[index].isOpen
                                  ? null
                                  : Colors.grey,
                          fit: BoxFit.contain,
                        )
                      : Image.asset("assets/images/veterinario.png",
                          color:
                              widget.petPlacesModel.listPetShops[index].isOpen
                                  ? Colors.transparent
                                  : Colors.grey,
                          fit: BoxFit.contain),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${widget.petPlacesModel.listVeterinary[index].name}",
                            style: TextStyle(
                                fontSize: 16,
                                color: widget.petPlacesModel.listPetShops[index]
                                        .isOpen
                                    ? Color_Scheme.primaryColor
                                    : Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${widget.petPlacesModel.listVeterinary[index].address}",
                            style: TextStyle(
                                fontSize: 14,
                                color: widget.petPlacesModel.listPetShops[index]
                                        .isOpen
                                    ? Color_Scheme.primaryColor
                                    : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${widget.petPlacesModel.listVeterinary[index].distance} km",
                            style: TextStyle(
                                fontSize: 14,
                                color: widget.petPlacesModel.listPetShops[index]
                                        .isOpen
                                    ? Color_Scheme.primaryColor
                                    : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Text(
                                    "${widget.petPlacesModel.listVeterinary[index].rating}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: widget.petPlacesModel
                                                .listVeterinary[index].isOpen
                                            ? Color_Scheme.primaryColor
                                            : Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            )),
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
        // Navigator.push(context, MaterialPageRoute(builder: (context) => PetGeneralView(widget.petPlacesModel.listPetShops[index])));
      },
    );
  }
}
