import 'package:flutter/material.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProductFavComponent extends StatelessWidget {
  const ProductFavComponent();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    bool like = true;
    return         Container(
                    width: mediaQuery.width,
                    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
      
      shadowColor: Color(0x802196F3),
      child: Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/Capture.PNG"),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chaussures",
                style: styleTexte,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "3000 XAF",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.orangeAccent),
                  // children: [
                  //   TextSpan(
                  //       text: " x78",
                  //       style: Theme.of(context).textTheme.bodyText1),
                  // ],
                ),
              )
            ],
          ),
        ),
// SizedBox(width: mediaQuery.width / 20),
Spacer(),
Container(
  child: 
  IconButton(icon: Icon(FontAwesomeIcons.opencart, color: Color(orangeEclatant),), onPressed: (){
    
          
         
  },)
),
Spacer(),

Container(
  margin: EdgeInsets.only(right: mediaQuery.width / 40),
  child:
  StatefulBuilder(
       builder:
       (BuildContext context, StateSetter setState) {
           return IconButton( icon: Icon(
             (like) ?
             FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart, 
             
             color: Colors.redAccent,
),
onPressed: (){
  setState(() {
          like = !like;
                  });
         
},
);
                                },
                              )  
),
        
        
      ],
    ),
    ),
    );
  }
}