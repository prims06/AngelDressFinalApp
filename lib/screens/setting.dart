import 'package:angeldress/screens/bottom_nav_bar.dart';
import 'package:angeldress/screens/commande.dart';
import 'package:angeldress/screens/page.dart';
import 'package:angeldress/screens/seller/seller_bottom_nav_bar.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/setting_component.dart';
import 'package:angeldress/screens/seller/seller_home.dart';

import 'assistance.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    bool like = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      title: 
          Text(
            "Setting",
            style: styleTitreAppBAr,
          ),
      ),
    
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.width,
              height: mediaQuery.height,
          color: Colors.white,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: mediaQuery.width,
                height: mediaQuery.height / 1.3,
                // margin: EdgeInsets.all(5.0),
                child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        SettingComponent(text: "Mode sombre", icon: FontAwesomeIcons.adjust,iconEnd: FontAwesomeIcons.toggleOff, profilPress: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyPage()));},),
        SettingComponent(text: "Langue", icon: FontAwesomeIcons.language,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){_showDialog(context);}),
        SettingComponent(text: "Mode vendeur", icon: FontAwesomeIcons.shareSquare,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SellerHomeScreen()));}),
        SettingComponent(text: "Assistance", icon: FontAwesomeIcons.question,iconEnd: FontAwesomeIcons.chevronRight, profilPress: (){      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AssistanceScreen()));}),
       
      ], ),
              ),
            ), 
          ],
          ),
        ),
      ),
      
    );
  }
}

Future<void> _showDialog(BuildContext context, {AlertDialog Function(BuildContext context) builder}){
    // ignore: missing_return
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Quel langue parlez-vous ?", style: styleTexte,),
        content: SingleChildScrollView(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Text("Francais", style: styleTexte,
                    ),
                  ),
                  onTap: (){
                    
                    Navigator.of(context).pop();
                  },
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  child: Text("English", style: styleTexte,),
                ),
                onTap: (){Navigator.of(context).pop();},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      );
    });
  }
