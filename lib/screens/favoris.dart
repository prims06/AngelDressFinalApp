import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import '../models/product_fav_component.dart';

class FavorisProductScreen extends StatelessWidget {
  const FavorisProductScreen();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    bool like = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      title: Column(
        children: [
          Text(
            "Yours Favoris",
            style: styleTitreAppBAr,
          ),
          Text(
            "6 items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    ),
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.width,
              height: mediaQuery.height,
          color: Colors.white,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: mediaQuery.width,
                height: mediaQuery.height / 1.3,
                // margin: EdgeInsets.all(5.0),
                child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        ProductFavComponent(),
        ProductFavComponent(),
        ProductFavComponent(),
        ProductFavComponent(),
        ProductFavComponent(),
        ProductFavComponent(),
        ProductFavComponent(),
      ], ),
              ),
            ), 
          ],
          ),
        ),
      ),
      
    );
  }
}