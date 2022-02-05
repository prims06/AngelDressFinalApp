import 'package:angeldress/screens/cart.dart';
import 'package:angeldress/screens/seller_bottom_nav_bar.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10.0,
          shadowColor: Color(0x802196F3),
          toolbarHeight: mediaQuery.height / 4,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: mediaQuery.width / 20,right: mediaQuery.width / 20, top:mediaQuery.height / 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("ANGEL DRESS", style: GoogleFonts.montserratSubrayada(fontSize: 20.0),)
                    ),
                    Row(
                      
                      children: [ 
                        CircleAvatar(
                            backgroundColor: Color(0xffeaeaec),
                            child: IconButton(icon: Icon(FontAwesomeIcons.search, 
                            ), onPressed: null),
                          ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Color(0xffeaeaec),
                            child: IconButton(icon: Icon(FontAwesomeIcons.opencart,
                             color: Color(orangeEclatant),), onPressed: (){
                               
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
    
                             }),
                          ),
                        ),
                        IconButton(icon: Icon(FontAwesomeIcons.shareSquare,color: Color(orangeEclatant),
                         ), onPressed: (){
                                              
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SellerBottomNavBar()));
    
                         }),
                      ],
                    ),
                  ],
                ),
                
                ),
              // Padding(
              //   padding: const EdgeInsets.only(left:10.0),
              //   child: Align(
                  
              //     alignment: Alignment.bottomLeft,
              //     child: IconButton(icon: Icon(FontAwesomeIcons.sortAmountDownAlt,
              //              ), onPressed: (){}),
              //   ),
              // ),
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Color(orangeEclatant),
                isScrollable: true,
                
                unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 18.0, color: Color(orangeEclatant)),
                // labelStyle: GoogleFonts.montserrat(fontSize: 18.0, color: Color(orangeEclatant)),
                
                
                tabs: [
                  Tab(
                    text: 'Tout   ',

                    // icon: IconButton(icon: Icon(FontAwesomeIcons.sortDown), onPressed: (){},),
                  // iconMargin: EdgeInsets.all(5.0),
                  

                  ),
                  Tab(
                    text: 'Vetements   ',
                  ),
                  Tab(
                    text: 'Chaussures   ',
                  ),
                  Tab(
                    text: 'Accessoires   ',
                  ),
                  
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IncomingPage(),
            OutgoingPage(),
            MissedPage(),
            AccessPage(),
          ],
        ),
      ),
    );
  }
}

class IncomingPage extends StatefulWidget {
  @override
  _IncomingPageState createState() => _IncomingPageState();
}

class _IncomingPageState extends State<IncomingPage>
    with AutomaticKeepAliveClientMixin<IncomingPage> {
  int count = 10;

  void clear() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
        body: GridView.count(crossAxisCount: 2,
        childAspectRatio: ( 500 / mediaQuery.height / 1.4),
        children: [
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
         ProductComponent(),
        ],

        ),
      // ),
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: clear,
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class OutgoingPage extends StatefulWidget {
  @override
  _OutgoingPageState createState() => _OutgoingPageState();
}

class _OutgoingPageState extends State<OutgoingPage>
    with AutomaticKeepAliveClientMixin<OutgoingPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Icon(Icons.call_made_outlined, size: 350),
        child:  Center(
        child: Text("Vetements"),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MissedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Chaussures"),
        );
  }
}
class AccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Accessoires"),
        );
  }
}