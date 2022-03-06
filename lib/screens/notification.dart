import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen();

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
                "Notifications",
                style: styleTitreAppBAr,
              ),
              Text(
                "6 notifications",
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