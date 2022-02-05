import 'package:angeldress/screens/cart.dart';
import 'package:angeldress/screens/seller_home.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return    Container(
      
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onLongPress: (){print("Ajouter au panier");},
        onTap: (){print("toi !");},
        child:Material(
          
           elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
        
        shadowColor: Color(0x802196F3),
              child: Stack(
                              children:[
                                
                                
                              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.all(5.0),
                      height:mediaQuery.height /4,
                      // width: mediaQuery.width ,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFECDF),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          
                          image: ExactAssetImage("assets/prod.jpg")
                        ),
                      ),
                      // child: Image.asset("assets/prod.jpg")
                    ),
                   Container(
                     padding: EdgeInsets.all(5),
                     child: Stack(
                                          children: [
                                            Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               Container(
                                 width: mediaQuery.width / 3.75,
                                 child: Text(
                    "Chaussure",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: styleTexte,
                    
                  ),
                               ),
                  Spacer(),
                  Row(
                    children: [
Text("3.4", style: TextStyle(fontWeight: FontWeight.w600,),),
                  Icon(FontAwesomeIcons.solidStar, size: 15, color: Colors.orangeAccent,),
                    ],
                  )
                  
                  // Text.rich(
                  //   TextSpan(
                  //       text: "3.4 ",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w600,),
                  //   ),
                  // ),
                  // Icon(FontAwesomeIcons.solidStar, size: 15, color: Colors.orangeAccent,),
                  // Container(width: 10,),
                             ],
                           ),
                  SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                        text: "3000 XAF",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.orangeAccent),
                    ),
                  ),
                  
                            SizedBox(height: 5),
                        Text(
                    "Echange: Oui",
                    style: styleTexte,
                        ),
                         
                  
                         ],
                       ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                            child:Card(
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                              child: StatefulBuilder(
       builder:
       (BuildContext context, StateSetter setState) {
           return IconButton( icon: Icon(
             
             FontAwesomeIcons.solidHeart, 
             
             color: Colors.redAccent,
),
onPressed: (){
         
},
);
             },
                  ),
                                            ),
                                          )
                                          ),
                                          ],),
                   ),
                  ],
                ),
            //  Align(
            //                    alignment: Alignment.topLeft,  
            //             child: Container(
            //               margin: EdgeInsets.only(top:18),
            //               child: Transform.rotate(
            //                 angle: -1,
            //                                         child: Container(
            //                   height: 30,
            //                   width: 70,
            //                   color: Colors.orangeAccent,
            //                   child: Text("Recycler", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.white),),
            //                 ),
            //               ),
            //             ),
                     
            //         ),
             ] ),
          ),
        ),
    );

          
  }
}