import 'package:angeldress/screens/profile.dart';
import 'package:angeldress/screens/favoris.dart';
import 'package:angeldress/screens/setting.dart';
import 'package:angeldress/screens/home_page.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  // const BottomNavBar({ Key  key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    FavorisProductScreen(),
    SettingScreen(),
    ProfileScreen(),
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
              icon: Icon(FontAwesomeIcons.home),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.slidersH),
              label: 'Parametre',
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