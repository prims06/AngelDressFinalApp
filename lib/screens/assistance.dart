import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';

class AssistanceScreen extends StatelessWidget {
  const AssistanceScreen();

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
                "Assistance",
                style: styleTitreAppBAr,
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
