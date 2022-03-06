import 'package:angeldress/screens/seller/add_product.dart';
import 'package:angeldress/screens/seller/admin_home.dart';
import 'package:angeldress/screens/cart.dart';
import 'package:angeldress/screens/favoris.dart';
import 'package:angeldress/screens/seller/seller_home.dart';
import 'package:angeldress/screens/seller/seller_profile.dart';
import 'package:angeldress/screens/setting.dart';
import 'package:angeldress/screens/home_page.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerBottomNavBar extends StatefulWidget {
  // const SellerBottomNavBar({ Key  key }) : super(key: key);

  @override
  _SellerBottomNavBarState createState() => _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends State<SellerBottomNavBar> {

 
 int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    
    AdminHomeScreen(),
    SellerHomeScreen(),
    NewProductScreen(),
    SellerProfileScreen()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
              child: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
type: BottomNavigationBarType.fixed,
selectedLabelStyle: styleTexte,
backgroundColor: Color(orangeEclatant),


          // elevation: 10,
          // backgroundColor: Color(orangeEclatant),
          // // selectedLabelStyle: TextStyle(fontSize: 20, color: Color(orangeEclatant)),
          items: const <BottomNavigationBarItem>[
            
              BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartLine),
              label: 'Dashboard',
            ),
            
            
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tachometerAlt),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plus),
              label: 'Ajout',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUser),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}