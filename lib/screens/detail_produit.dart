
import 'package:angeldress/models/default_button.dart';
import 'package:flutter/material.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var isFavourite = true;
    return  Scaffold(
          body: 
          Container(
            height:mediaQuery.height,
              child: Stack(
                overflow: Overflow.visible,
         children:[
             Align(
                             alignment:Alignment.topCenter,
                             child:
                         Stack(
                                                  
                                                children: [Container(
                                    // margin: EdgeInsets.all(5.0),
                                    height:mediaQuery.height /2.2,
                                    // width: mediaQuery.width ,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFECDF),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        // colorFilter: ColorFilter.mode(Color(orangeEclatant).withOpacity(0.5), BlendMode.dstATop),
                                        image: ExactAssetImage("assets/prod.jpg")
                                      ),
                                    ),
                                    // child: Image.asset("assets/prod.jpg")
                                  ),
                                  
         ]
                           ),
                         ),

                         


                              
                              
                                                      Column(
                                                        children: [
                                                          Align(

                             alignment:Alignment.topLeft,
                                                child: Padding(
                                                  padding:EdgeInsets.only(left:mediaQuery.width/20, top:mediaQuery.height/20),
                                                  child: InkWell(
                                    child: Icon(FontAwesomeIcons.chevronLeft,),
                                    onTap: (){Navigator.of(context).pop();},
                                    // child: Image.asset("assets/prod.jpg")
                                  ),
                                                ),
                           ),
                           Spacer(),
                                                          SingleChildScrollView(
                                                                                                                      child: Container(
                                    // margin: EdgeInsets.only(top:mediaQuery.height /2.4,),
                                     height:mediaQuery.height /1.7,
                    padding: EdgeInsets.only(left:mediaQuery.width / 20,bottom:mediaQuery.width / 10,top:mediaQuery.width / 10),
               decoration: BoxDecoration(
                      color:
                          Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
               child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   
                       Align(
                         alignment: Alignment.topLeft,
                         child: Column(children: [
                           Row(children: [
                         Text("Chaussure™", style: styleTitre,)
                       ],),
                      Container(
                        height: 10.0,
                      ),
                       Row(children: [
                         RatingBarIndicator(
                           itemCount: 5,
                           rating: 3.5,
                           itemSize: mediaQuery.width/15,

                           itemBuilder: (context, index)=>
                         Icon(Icons.star,
                         color: Colors.amber,),
                         ),
                       ],),
                         ],),
                       ),
                       
                       Align(
                     
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(top:mediaQuery.width/105),
                          padding: EdgeInsets.all(mediaQuery.width/95),
                          width: mediaQuery.width/6,
                          decoration: BoxDecoration(
                            color:
                                    isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Icon(FontAwesomeIcons.solidHeart, size: mediaQuery.width/10, color: Colors.red,),

                     ),
                   ),
                    Align(
                     
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top:mediaQuery.width/105),
                          padding: EdgeInsets.all(mediaQuery.width/95),
                          child: Row(children: [
                            Container(
                                  width: mediaQuery.width/1.34,
                                  child: Text("   Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing ",
                                  textAlign: TextAlign.justify,
                                  style: styleTexte,
                                  ),
                            ),
                          ],),
                        ),
                   ),
                   
Spacer(),
Container(child: 
Row(
  mainAxisAlignment : MainAxisAlignment.start,
  children: [
    Text('12/02/2022'),
Text('.', style:  GoogleFonts.montserrat(fontSize:30)),
    Text('Neuf'),
Text('.', style:  GoogleFonts.montserrat(fontSize:30)),
    Text('Echangeable'),

    
    
  ],
),),
Spacer(),
                     
                   Align(
                     alignment: Alignment.bottomCenter,
                                        child: DefaultButton(
                       text: "Ajouter au panier",
                       press: (){print('Added');},
                       ),
                   ),
                 ],
               ),
         ),
                                                          ),
                                                        ],
                                                      ),
       
                                  
         ]
                                ),
                              ),
                            
                        
                    

            );

    



  }
    }