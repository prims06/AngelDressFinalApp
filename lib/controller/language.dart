import 'package:flutter/material.dart';
import 'package:angeldress/sources/variables.dart';
  Future<void> _showDialog(BuildContext context, {AlertDialog Function(BuildContext context) builder}){
    // ignore: missing_return
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Quel langue parlez-vous ?", style: styleTexte,),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Row(
                    children: [
                      // Icon(FontAwesomeIcons., color: Color(Orange),),
                      SizedBox(width: 10.0),
                      Text("Français", style: styleTexte,),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Row(
                    children: [
                      // Icon(FontAwesomeIcons.image, color: Color(Orange)),
                      SizedBox(width: 10.0),
                      Text("English", style: styleTexte,),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

 