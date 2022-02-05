
import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'package:angeldress/models/product_add.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
class NewProductScreen extends StatefulWidget {
  const NewProductScreen();
  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomProduit = TextEditingController();
  TextEditingController prixProduit = TextEditingController();
  TextEditingController qteProduit = TextEditingController();
  TextEditingController descProduit = TextEditingController();
  var prixint;
  List<ProductAdd> articlesVendeur = [];

  List<String> lst = ["Neuf", "Recyclé"];
  String selectedIndex = "Neuf";

  void artState(String index) {
    setState(() {
      selectedIndex = index;
      print(index);
    });
  }

  Widget customRadio(String txt, String index) {
    return OutlineButton(
      onPressed: () => artState(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(
          color: selectedIndex == index ? Color(orangeEclatant) : Colors.black38),
      child: Text(
        txt,
        style: GoogleFonts.montserrat(
            color: selectedIndex == index ? Color(orangeEclatant) : Colors.black38),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  String Cathegorie;

  // ignore: non_constant_identifier_names
  List Options = [
    "Vetements",
    "Chaussures",
    "Accessoires",
  ];

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

   bool Echange = false;
   //  String NomProduit;
   //  int QteProduit;
   //  String DescriptionProduit;
   //  int PrixProduit;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Ajouter un produit",
          style: styleTitreAppBAr,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FlatButton(
                      // color: Colors.black38,
                      onPressed: loadAssets,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        width: 350,
                        height: 200,
                        child:imagesArticles.isNotEmpty == false ?  Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Center(
                              child: SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.images,
                                  color: Color(orangeEclatant),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Photos du produit",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18.0, color: Color(orangeEclatant)),
                                ),
                              ],
                            ),
                          )),
                        ): buildGridView(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cathegorie :",
                                style: styleTexte,
                              ),
                              DropdownButton(
                                hint: Text(
                                  "Cathegorie de l'article",
                                  style: GoogleFonts.montserrat(fontSize: 14.0),
                                ),
                                value: Cathegorie,
                                style: GoogleFonts.montserrat(
                                    fontSize: 14.0, color: Color(0xff707070)),
                                onChanged: (newCathegorie) {
                                  setState(() {
                                    Cathegorie = newCathegorie;
                                  });
                                },
                                // ignore: non_constant_identifier_names
                                items: Options.map((Cathegorie) {
                                  return DropdownMenuItem(
                                    value: Cathegorie,
                                    child: Text(Cathegorie),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nom de l'article :",
                                style: styleTexte,
                              ),
                              SizedBox(
                                width: 170.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (name) {nomProduit = name as TextEditingController;} ,
                                  controller: nomProduit,
                                  decoration: InputDecoration(
                                    hintText: "Exemple : Chaussure Joy",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Prix de l'article :",
                                style: styleTexte,
                              ),
                              SizedBox(
                                width: 170.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (prix) {prixProduit = prix as TextEditingController;} ,
                                  controller: prixProduit,
                                  decoration: InputDecoration(
                                    hintText: "Exemple : 1000 XAF",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Statut de l'article",
                                style: styleTexte,
                              ),
                              customRadio(lst[0], "Neuf"),
                              customRadio(lst[1], "Recyclé"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quantite disponibles :",
                                style: styleTexte,
                              ),
                              SizedBox(
                                width: 120.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (qte) {qteProduit = qte as TextEditingController;} ,
                                  controller: qteProduit,
                                  decoration: InputDecoration(
                                    hintText: "Exemple : 10",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Acceptez-vous les échanges ?",
                                style: styleTexte,
                              ),
                              StatefulBuilder(
                                builder:
                                    (BuildContext context, StateSetter setState) {
                                  return Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Color(orangeEclatant),
                                    // hoverColor: Colors.green,
                                    // focusColor: MaterialStateProperty.resolveWith(getColor),
                                    value: Echange,
                                    onChanged: (bool value) {
                                      setState(() {
                                        Echange = value;
                                        print(Echange);
                                      });
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Description :",
                                    style: styleTexte,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  maxLength: 500,
                                  // cursorHeight: 300,
                                  keyboardType: TextInputType.text,
                                  onChanged: (desc) {descProduit = desc as TextEditingController;} ,
                                  controller: descProduit,
                                  decoration: InputDecoration(
                                    hintText: "Decrivez votre produit",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                ProductAdd article = new ProductAdd(nomProduit: nomProduit.text, prixProduit: prixProduit.text, qteProduit: qteProduit.text);
                                if (_formKey.currentState.validate()){
                                  
                                    }
                                    else{
                                      return null;
                                    }
                                    _formKey.currentState.save();
                                nomProduit.clear();prixProduit.clear();qteProduit.clear();descProduit.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(orangeEclatant),
                                  //// background
                                  onPrimary: Colors.black38,
                                  elevation: 11,
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          40.0)) // foreground
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.bookmark,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text("Enregistrer l'article",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20.0, color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  List<Asset> imagesArticles = <Asset>[];

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      children: List.generate(imagesArticles.length, (index) {
        Asset asset = imagesArticles[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),
        );
      }),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 7,
        enableCamera: true,
        selectedAssets: imagesArticles,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "camera"),
        materialOptions: MaterialOptions(
          actionBarColor: "#db7032",
          actionBarTitle: "Angel Dress",
          allViewTitle: "All Images",
          useDetailsView: true,
          selectCircleStrokeColor: "#707070",
        ),
      );
    } on Exception {
    }
    if (!mounted) return;

    setState(() {
      imagesArticles = resultList;
    });
  }
}
class Article extends StatelessWidget {
  final ProductAdd arti;
  final Function delete;
  Article({this.arti, this.delete});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 0.0),
      child: Card(
        color: Colors.black38.withOpacity(0.001),
        // padding: EdgeInsets.all(0),
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // onPressed: (){},
        child: Row(
          children: <Widget>[
            Ink(
              height: 70.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Colors.black,
                // image: DecorationImage(
                //   // image: this.elmt.picture,
                //   fit: BoxFit.cover,
                //   alignment: Alignment.center,
                // ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:ListTile(
                        title: Text(this.arti.nomProduit),
                        subtitle: Text(this.arti.prixProduit.toString()+" XAF"),
                      ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            Image.asset("assets/heart.svg", width: 30.0,),
                            SizedBox(width: 7.0,),
                            Text(this.arti.qteProduit.toString()),
                          ],
                        )
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.ellipsisV, color: Color(0xffdb7032),
                        size: 15.0,),
                      onPressed: this.delete,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

