import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/places/pet_places_model.dart';

class ListPetShopsView extends StatefulWidget {
  final PetPlacesModel petPlacesModel;
  final Color_Scheme color_scheme;

  ListPetShopsView({@required this.petPlacesModel, this.color_scheme});

  @override
  _ListPetShopsViewState createState() => _ListPetShopsViewState();
}

class _ListPetShopsViewState extends State<ListPetShopsView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PetShops próximos", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: widget.color_scheme.primaryColorTheme,
        iconTheme: IconThemeData(
            color: Color_Scheme.secondaryLigthColor
        ),
      ),
      backgroundColor: widget.color_scheme.themeColor,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : widget.petPlacesModel.listPetShops == null
              ? Container()
              : ListView.builder(
                  itemCount: widget.petPlacesModel.listPetShops.length,
                  itemBuilder: (context, index) {
                    return _petCard(context, index);
                  },
                ),
    );
  }

  Widget _petCard(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
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
                  child: widget.petPlacesModel.listPetShops[index]
                          .urlImageAvatar.isNotEmpty
                      ? Image.network(
                          "${widget.petPlacesModel.listPetShops[index].urlImageAvatar}",
                          color:
                              widget.petPlacesModel.listPetShops[index].isOpen
                                  ? null
                                  : Colors.grey,
                          fit: BoxFit.contain,
                        )
                      : Image.asset("assets/images/banho_pet.png",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${widget.petPlacesModel.listPetShops[index].name}",
                            textAlign: TextAlign.left,
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
                            "${widget.petPlacesModel.listPetShops[index].address}",
                            textAlign: TextAlign.left,
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
                            "${widget.petPlacesModel.listPetShops[index].distance} km",
                            textAlign: TextAlign.left,
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
                                  "${widget.petPlacesModel.listPetShops[index].rating}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: widget.petPlacesModel
                                              .listPetShops[index].isOpen
                                          ? Color_Scheme.primaryColor
                                          : Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: widget.petPlacesModel.listPetShops[index].isOpen
          ? () {
              print("clicou");
            }
          : null,
    );
  }
}
