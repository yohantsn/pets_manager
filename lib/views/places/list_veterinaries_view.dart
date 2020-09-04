import 'package:flutter/material.dart';
import 'package:pets_manager/core/colors_scheme.dart';
import 'package:pets_manager/models/pet_places_model.dart';
import 'package:pets_manager/views/pet/cadastro_pet_view.dart';

class ListVeterinariesView extends StatefulWidget {
  final PetPlacesModel petPlacesModel;

  ListVeterinariesView({@required this.petPlacesModel});
  @override
  _ListVeterinariesViewState createState() => _ListVeterinariesViewState();
}

class _ListVeterinariesViewState extends State<ListVeterinariesView> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veterinários próximos", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : widget.petPlacesModel.listVeterinary == null
          ? Container()
          :ListView.builder(
        itemCount: widget.petPlacesModel.listVeterinary.length,
        itemBuilder: (context, index){
          return _petCard( context,  index);
        },
      ),
    );
  }
  Widget _petCard(BuildContext context, int index){
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
            height: 130,
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
                    image: DecorationImage(
                        image: widget.petPlacesModel.listVeterinary[index].urlImageAvatar.isNotEmpty
                       ? NetworkImage("${widget.petPlacesModel.listVeterinary[index].urlImageAvatar}")
                            : AssetImage("assets/images/veterinario.png"),
                        fit: BoxFit.fill),
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
                            "${widget.petPlacesModel.listVeterinary[index].name}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color_Scheme.primaryColor,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${widget.petPlacesModel.listVeterinary[index].address}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color_Scheme.primaryColor,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "${widget.petPlacesModel.listVeterinary[index].distance} km",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color_Scheme.primaryColor,
                                fontWeight: FontWeight.w400
                            ),
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
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => PetGeneralView(widget.petPlacesModel.listPetShops[index])));
      },
    );
  }
}

