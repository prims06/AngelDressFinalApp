import 'package:angeldress/screens/cart.dart';
import 'package:angeldress/screens/seller/seller_home.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductSellerComponent extends StatelessWidget {
  const ProductSellerComponent();

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
        // SizedBox(width: 10),
        Container(
          padding: EdgeInsets.only(left:10.0,right:10.0,top:10.0,bottom:1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chaussures",
                style: styleTexte,
                maxLines: 2,
              ),
              SizedBox(height: 30),

              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.checkDouble, color: Colors.green,size: 15,),
                  Text("12",style: styleTexte,),
                ],
              ),
              SizedBox(width: 10),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.heart,color: Colors.red,size: 15,),
                  Text("12",style: styleTexte,),
                ],
              ),
              SizedBox(width: 10),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.exclamationTriangle,color: Colors.yellow,size: 15,),
                  Text("12",style: styleTexte,),
                ],
              ),
              SizedBox(width: 10),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.solidStar,color: Colors.amber,size: 15,),
                  Text("4.5",style: styleTexte,),
                ],
              ),
                ],
              ),
              
            ],
          ),
        ),
Spacer(), 
Align(
                        alignment: Alignment.topRight,
                                              child: PopupMenuButton<int>(
                          onSelected: (item)=> {print('Select: $item')},
                          itemBuilder: (context) => [
                          PopupMenuItem<int>(value:0, child: Text("Modifier",style: styleTexte,),),
                          PopupMenuItem<int>(value:1, child: Text("Supprimer",style: styleTexte,),),
                        ],
                        ),
                      )
      ],
    ),
    ),
    );
  }
}