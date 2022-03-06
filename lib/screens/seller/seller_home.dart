import 'package:angeldress/models/product_seller_component.dart';
import 'package:angeldress/screens/seller/add_product.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/product_fav_component.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({ key }) : super(key: key);

  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  
  @override
  Widget build(BuildContext context) {

   var mediaQuery = MediaQuery.of(context).size;

    return Scaffold( 
      
      appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(orangeEclatant)),
          title: Column(
            children: [
              Text(
                "Mode vendeur",
                style: styleTitreAppBAr,
              ),
             
            ],
          ),
        ),
      // body:    SingleChildScrollView(
                  body: SingleChildScrollView(
                                      child: Container(
                                        height: mediaQuery.height/1.3,
            color: Colors.white,
            margin: EdgeInsets.only(top: 20.0, left: mediaQuery.width/58,right: mediaQuery.width/58, bottom: mediaQuery.width/5),
            child: ListView(
              children: [
                Container(
                  
                    width: mediaQuery.width,
                    height: 125.0,
                    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
      
      shadowColor: Color(0x802196F3),
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
        onTap:  () { print('Not set yet'); },
        child: 
        Padding
                    (
                      padding: const EdgeInsets.all(24.0),
                      child: Row
                      (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>
                        [
                          Column
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>
                            [
                              Text('Solde', style: GoogleFonts.montserrat(color: Colors.blueAccent)),
                              Spacer(),
                              Text('25000 XAF', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                            ],
                          ),
                          Material
                          (
                            color: Color(orangeEclatant),
                            borderRadius: BorderRadius.circular(24.0),
                            child: Center
                            (
                              child: Padding
                              (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(FontAwesomeIcons.wallet, color: Colors.white, size: 30.0),
                              )
                            )
                          )
                        ]
                      ),
                    ),
      ),
    ),
                ),

                Row(
                    children: [
                      Container(
                    width: mediaQuery.width / 2,
                    height: 180.0,
                    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
      
      shadowColor: Color(0x802196F3),
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
        onTap:  () { print('Not set yet'); },
        child:Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column
                      (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Material
                          (
                            color: Colors.teal,
                            shape: CircleBorder(),
                            child: Padding
                            (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(FontAwesomeIcons.exchangeAlt, color: Colors.white, size: 30.0),
                            )
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Ventes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                          Text('12 articles', style: TextStyle(color: Colors.black45)),
                        ]
                      ),
                    ),
        
        ),
    ),
                ),
                Container(
                    width: mediaQuery.width / 2.2,
                    height: 180.0,
                    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
      
      shadowColor: Color(0x802196F3),
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
        onTap:  () { print('Not set yet'); },
        child:
        Padding
                    (
                      padding: const EdgeInsets.all(20.0),
                      child: Column
                      (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Material
                          (
                            color: Colors.amber,
                            shape: CircleBorder(),
                            child: Padding
                            (
                              padding: EdgeInsets.all(16.0),
                              child: Icon(FontAwesomeIcons.bookmark, color: Colors.white, size: 30.0),
                            )
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)
                          ),
                          Text('Produits', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                          Text('7 produits', style: TextStyle(color: Colors.black45)),
                        ]
                      ),
                    ),
                ),
        
         ),
    ),
                    ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Produits :",style:GoogleFonts.montserrat(fontSize: 30.0, color: Colors.black87,),),
                ),

ProductSellerComponent(),
              
ProductSellerComponent(),
              
ProductSellerComponent(),
              
ProductSellerComponent(),
              ],
            ),

                
              ),
          ),
          
        );
  }

}
