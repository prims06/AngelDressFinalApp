import 'package:flutter/material.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/setting_profile_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                              image: ExactAssetImage("assets/prod.jpg")
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
                              children:[CircleAvatar(
                                radius: mediaQuery.height / 15,
                                backgroundImage: AssetImage("assets/prod.jpg") ,
                                
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
                                children: [SettingProfileComponent(text: "Mode sombre", icon: FontAwesomeIcons.adjust,iconEnd: FontAwesomeIcons.toggleOff, profilPress: (){},),
          SettingProfileComponent(text: "Langue", icon: FontAwesomeIcons.language,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){}),
          SettingProfileComponent(text: "Mode vendeur", icon: FontAwesomeIcons.shareSquare,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){ }),
          SettingProfileComponent(text: "Commandes", icon: FontAwesomeIcons.bookmark,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){},),
          SettingProfileComponent(text: "Historique", icon: FontAwesomeIcons.history,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){},),
          SettingProfileComponent(text: "Assistance", icon: FontAwesomeIcons.question,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){},),
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
}