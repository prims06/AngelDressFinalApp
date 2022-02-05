import 'package:angeldress/screens/add_product.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/product_fav_component.dart';

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
              ),]),
                      actions: [
          Container(
            margin: EdgeInsets.all(mediaQuery.width / 50),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/Capture.PNG",),
              maxRadius: mediaQuery.height / 20,
              
            ),
          ),
          
        ],
        toolbarHeight: 80.0,
        elevation: 10.0,
        shadowColor: Color(0x802196F3),
      ),
      // body:    SingleChildScrollView(
                  body: SingleChildScrollView(
                                      child: Container(
                                        height: mediaQuery.height,
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: mediaQuery.width/58),
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
                              Text('Solde', style: TextStyle(color: Colors.blueAccent)),
                              Text('25000 XAF', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                            ],
                          ),
                          Material
                          (
                            color: Colors.blue,
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
ProductFavComponent(),
              
ProductFavComponent(),
              
ProductFavComponent(),
              
ProductFavComponent(),
              ],
            ),

                
              ),
          ),
          
        );
  }

}
