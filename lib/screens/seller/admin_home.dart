import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen();

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(orangeEclatant)),
          title: 
              Text(
                "Your Cart",
                style: styleTitreAppBAr,
              ),
              
        ),
         
      
    );
  }
}