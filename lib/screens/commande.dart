import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';

class CommandeScreen extends StatelessWidget {
  const CommandeScreen();

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
                "Commandes",
                style: styleTitreAppBAr,
              ),
              Text(
                "6 awaiting commands",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
          body:  Container(
              width: mediaQuery.width,
                  height: mediaQuery.height,
              color: Colors.white,
           
            ),
    
    );
  }
}