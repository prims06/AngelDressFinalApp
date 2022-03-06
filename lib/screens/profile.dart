
import 'dart:io';

import 'package:angeldress/controller/database.dart';
import 'package:angeldress/screens/commande.dart';
import 'package:angeldress/screens/history.dart';
import 'package:angeldress/screens/notification.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../models/setting_profile_component.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   File _imgFile;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
          body: Container(
        child: Stack(
       children:[
                 Stack(
                children: [
                            Container(
                          // margin: EdgeInsets.all(5.0),
                          height:mediaQuery.height /2.5,
                          // width: mediaQuery.width ,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFECDF),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              colorFilter: ColorFilter.mode(Color(orangeEclatant).withOpacity(0.5), BlendMode.dstATop),
                              image: (_imgFile==null)?AssetImage("assets/prod.jpg"): FileImage(_imgFile),
                            ),
                          ),
                          // child: Image.asset("assets/prod.jpg")
                        ),
                        Column(
                          children: [
                            Container(
                              height: mediaQuery.height / 9,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                              children:[
                                
                                SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: (_imgFile==null)?AssetImage("assets/prod.jpg"): FileImage(_imgFile),
          ),
          Positioned(
            right: -5,
            bottom: 0,
            child: SizedBox(
            //   height: 40,
              width: 40,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () {_showDialog(context);
                
  
                },
                child: Icon(FontAwesomeIcons.camera),
              ),
            ),
          )
        ],
      ),
    ),


                              Container(
                              height: mediaQuery.height / 100,
                            ),
                              Text("Prim's Idriss", style: styleTitre,)
                              ]
                              ),
                            ),
                          ],
                        )
                      ]
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
                                            child: Container(
                                              // color: Colors.white,
                          height: mediaQuery.height /1.7,
                          width: mediaQuery.width,
                          child: SingleChildScrollView(
                                                      child: Card(
                              
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                              // elevation: 0,
                              child: Column(
                                children: [
          SettingProfileComponent(text: "Location", icon: FontAwesomeIcons.mapPin,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){}),
          SettingProfileComponent(text: "Compte", icon: FontAwesomeIcons.addressCard,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){ }),
          SettingProfileComponent(text: "Commandes", icon: FontAwesomeIcons.bookmark,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CommandeScreen()));}),
          // SettingProfileComponent(text: "Notifications", icon: FontAwesomeIcons.clock,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen()));}),

          Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: FlatButton(
        // disabledColor: Colors.black38,
        // color: Colors.black38.withOpacity(0.1),
        // disabledColor: Colors.black38.withOpacity(0.1),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen()));},
        child: Row(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Icon(
                  FontAwesomeIcons.bell,
                  color: Color(orangeEclatant),
                  size: 22,
                ),
                Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  // border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "7",
                    style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
       
              ],
            ),
            SizedBox(width: 20),
            Expanded(child: Text("Notifications", style: GoogleFonts.montserrat(fontSize: 20.0,color: Color(0xff707070),),),),
            Icon(FontAwesomeIcons.chevronRight, color: Color(orangeEclatant),),
          ],
        ),
      ),
    ),
          SettingProfileComponent(text: "Mot de passe", icon: FontAwesomeIcons.key,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){},),
          SettingProfileComponent(text: "Historique", icon: FontAwesomeIcons.history,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HistoryScreen()));
            },),
          
          
        ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),

               ] 
               ),
        
      ),
    );
  }


final imagePicker = ImagePicker();
_openGallery(BuildContext context)async{
  // List<File> files = [];
  String link;
  final imgFile = await imagePicker.getImage(source: ImageSource.gallery);
  this.setState(() {
    // _imgFile = File(imgFile.path);
    
    // files.add(File(imgFile.path));
    _imgFile = File(imgFile.path);
    // uploadFile();
  });
  link = await DatabaseService().uploadImage(_imgFile, path: 'product');
 

  
  Navigator.of(context).pop();
}
_openCamera(BuildContext context) async{
  // final imgFile<XFile> = await imagePicker.getImage(source: ImageSource.gallery);
  final imgFile = await imagePicker.getImage(source: ImageSource.camera);
  this.setState(() {
    _imgFile = File(imgFile.path);
    // DatabaseService().uploadImage(_imgFile);
  });
  Navigator.of(context).pop();
}

//Boite de dialogue camera
Future<void> _showDialog(BuildContext context){
  // ignore: missing_return
  return showDialog(context: context,builder: (BuildContext context){
    return AlertDialog(
      title: Text("Choississez votre source", style: styleTexte,),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.camera, color: Color(orangeEclatant),),
                    SizedBox(width: 10.0),
                    Text("Camera", style: styleTexte,),
                  ],
                ),
                onTap: (){_openCamera(context);},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.image, color: Color(orangeEclatant)),
                    SizedBox(width: 10.0),
                    Text("Gallery", style: styleTexte,),
                  ],
                ),
                onTap: (){_openGallery(context);},
              ),
            ),
          ],
        ),
      ),
    );
  });
}
 Future uploadFile() async {
  //  final fileName = file != null ? basename(file!.path) : 'No File Selected';
    if (_imgFile == null) return;

    // final fileName = basename(_imgFile.path);
    final destination = 'files/image';

    UploadTask task = DatabaseService.uploadFile(destination, _imgFile);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }
}