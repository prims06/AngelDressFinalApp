import 'package:angeldress/screens/bottom_nav_bar.dart';
import 'package:angeldress/screens/cart.dart';
import 'package:angeldress/screens/favoris.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/seller/seller_home.dart';
import 'package:flutter/material.dart';
import 'controller/cache.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angel Dress',
      home:BottomNavBar(),
    );
  }
}
