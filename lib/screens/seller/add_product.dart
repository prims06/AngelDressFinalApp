
import 'dart:async';
import 'dart:io';
// ignore: avoid_web_libraries_in_flutter
import 'package:angeldress/controller/camera_call.dart';
import 'package:angeldress/controller/database.dart';
import 'package:angeldress/models/class/product.dart';
import 'package:angeldress/models/default_button.dart';
import 'package:angeldress/screens/seller/admin_bottom_nav_bar.dart';
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
  List <File> files = [];
  List<String>urlImages = [];
  Product currentProduct;
   List<Asset> imagesArticles = <Asset>[];
  List<String> lst = ["Neuf", "Recyclé"];
  String statut = "Neuf";
  bool loading = false;



  void artState(String index) {
    setState(() {
      statut = index;
      print(index);
    });
  }

  Widget customRadio(String txt, String index) {
    return OutlineButton(
      onPressed: () => artState(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(
          color: statut == index ? Color(orangeEclatant) : Colors.black38),
      child: Text(
        txt,
        style: GoogleFonts.montserrat(
            color: statut == index ? Color(orangeEclatant) : Colors.black38),
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
void initState() {
    super.initState();
    files = [];
  urlImages = [];
  
  }

  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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
      appBar:  AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(orangeEclatant)),
          title: Column(
            children: [
              Text(
                "Nouveau produit",
                style: styleTitreAppBAr,
              ),
            ],
          ),
        ),
      
     body: Stack(
       children: [
                      
         ListView(
            children: [Container(
              padding: const EdgeInsets.only(
                top: 0.0,
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
                
              ),
              
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*1.15,
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
                                  Card(
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                                    child: DropdownButton(
                                      underline: Container(),
                                      
                                      hint: Text(
                                        " Cathegorie du produit",
                                        style: GoogleFonts.montserrat(fontSize: 14.0),
                                      ),
                                      value: Cathegorie,
                                      
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14.0, color: Colors.black,),
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
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                      color:
                          Color(0xFFF5F6F9),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(40),
                      //   topRight: Radius.circular(40),
                      // ),
                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nom du produit :",
                                      style: styleTexte,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      // width: mediaQuery.width/1.6,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        validator: (value) {if(value == null || value.isEmpty) {
                                          return "Renseignez une quantite !";
                                        }
                                        return null;},
                                        onChanged: (nom) {nomProduit = nom as TextEditingController;
                                        
                                        } ,
                                        controller: nomProduit,
                                        decoration: InputDecoration(
                                          hintText: "Nom du produit",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  // border: BoxBorder().,
                      color:
                          Color(0xFFF5F6F9),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(40),
                      //   topRight: Radius.circular(40),
                      // ),
                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Prix du produit :",
                                      style: styleTexte,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      // width: mediaQuery.width/1.6,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {if(value == null || value.isEmpty) {
                                          return "Renseignez une quantite !";
                                        }return null;},
                                        onChanged: (prix) {prixProduit = prix as TextEditingController;
                                        
                                        } ,
                                        controller: prixProduit,
                                        decoration: InputDecoration(
                                          hintText: "Exemple : 1000 XAF",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                              Container(
                                decoration: BoxDecoration(
                      color:
                          Color(0xFFF5F6F9),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(40),
                      //   topRight: Radius.circular(40),
                      // ),
                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Quantite disponible :",
                                      style: styleTexte,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      // width: mediaQuery.width/1.6,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {if(value == null || value.isEmpty) {
                                          return "Renseignez une quantite !";
                                        }return null;},
                                        onChanged: (qte) {qteProduit = qte as TextEditingController;
                                       
                                        } ,
                                        controller: qteProduit,
                                        decoration: InputDecoration(
                                          hintText: "...",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),Row(
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
                                      SizedBox(height: mediaQuery.height/25,),
                                    ],
                                  ),
                                  Container(
                                    
                                    width: MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      maxLength: 500,
                                      // cursorHeight: 300,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 6,
                                      validator: (value) {if(value == null || value.isEmpty) {
                                          return "Decrivez pour attirer du monde !";
                                        }return null;},
                                      onChanged: (desc) {descProduit = desc as TextEditingController;
                                      } ,
                                      controller: descProduit,
                                      decoration: InputDecoration(
                                        hintText: "Decrivez votre produit",
                                        hintStyle: TextStyle(color: Colors.grey),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red, width: 1,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey, width: 1,
                                        ),
                                      ),
                                          // border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(orangeEclatant), width: 2,
                                        ),
                                      ),
                // enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              DefaultButton(
                                text: "Enregistrer",
                                press: () async {
                                  
                                  if(imagesArticles.length < 3){
                                        print("Ajouter des images");
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Row(children: [
                                      Text("Ajouter des images du produit", style: GoogleFonts.montserrat(color:Colors.black)),
                                      SizedBox(width: 10,),
                                      Icon(Icons.block_rounded,color: Colors.red,)

                                    ],),
                                    backgroundColor: Colors.white,
                                  ));
                                        return null;
                                      }
                                      else if(Cathegorie == null){
                                        
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Row(children: [
                                      Text("Choisissez une categorie pour le produit", style: GoogleFonts.montserrat(color:Colors.black)),
                                      SizedBox(width: 10,),
                                      Icon(Icons.block_rounded,color: Colors.red,)

                                    ],),
                                    backgroundColor: Colors.white,
                                  ));
                                        return null;
                                      }
                                   else if (_formKey.currentState.validate()){
                                     setState(() {
                                    loading = true;
                                  });
                                      
                                  
                                      
                                      
                                      for(int i=0; i<imagesArticles.length;i++){
                                      try{
                                       File file = await CameraCall().getImageFileFromAssets(imagesArticles[i]);
                                       String urlImg = await DatabaseService().uploadImage(file,path: 'products');
                                        urlImages.add(urlImg);
                                        print("success...:"+ urlImg);
                                      }

                                      catch (e){
                                        print("error as occured");

                                      }

                                      }
                                       currentProduct = new Product(DatabaseService().collectionProduit.doc().id,nomProduit.text, int.tryParse(prixProduit.text), (int.tryParse(prixProduit.text)*1.05), int.tryParse(qteProduit.text),0, Cathegorie,Echange,statut, descProduit.text, urlImages,0,0,DateTime.now(),"primsIdriss");
                                      bool save = await DatabaseService().saveProduct(currentProduct);
                                      
                                if (save) {

                                  
                                  setState(() {
                                    
                                  
                                    
                                    loading = false;
                                  });
                                   _formKey.currentState.save();
                                    nomProduit.clear();prixProduit.clear();qteProduit.clear();descProduit.clear();imagesArticles.clear();Cathegorie = null;Echange =false;
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Row(children: [
                                      Text("Enregistree avec success", style: GoogleFonts.montserrat(color:Colors.black)),
                                      SizedBox(width: 10,),
                                      Icon(FontAwesomeIcons.check,color: Colors.green,)

                                    ],),
                                    backgroundColor: Colors.white,
                                  ));
                                
                                  return true;
                                }
                                      
                                      }
                                      

                                        
                                        else{
                                          Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Row(children: [
                                      Text("Echec....", style: GoogleFonts.montserrat(color:Colors.black)),
                                      SizedBox(width: 10,),
                                      Icon(FontAwesomeIcons.xing,color: Colors.green,)

                                    ],),
                                    backgroundColor: Colors.white,
                                  ));
                                          
                                  
                                          return null;
                                          
                                        }
                                        
                                },
                              ),
                              
                              ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),]
            ),

            if(loading) 
                         Container(
                           height: mediaQuery.height,
                           width: mediaQuery.width,
                           color: Colors.white.withOpacity(0.7),
                           child: Center(
                                child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color(orangeEclatant)),
                            )
                            ),
                         ),
                         
           
       ],
     ),

    );
  }
 

  @override
  

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      children: List.generate(imagesArticles.length, (index) {
        Asset asset = imagesArticles[index];
        return Padding(
          padding: const EdgeInsets.only(right:8.0),
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
