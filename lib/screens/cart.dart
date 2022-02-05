import 'package:angeldress/screens/favoris.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
class CartScreen extends StatefulWidget {
  const CartScreen();


  @override
  _CartScreenState createState() => _CartScreenState();
}
  int _controller=0;

 

class _CartScreenState extends State<CartScreen> {

 @override
  void initState() {
    super.initState();
    _controller = 0; // Setting the initial value for the field.
  }

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
                "Your Cart",
                style: styleTitreAppBAr,
              ),
              Text(
                "6 items",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
          body:  Container(
              width: mediaQuery.width,
                  height: mediaQuery.height,
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: mediaQuery.width,
                    height: mediaQuery.height / 1.55,
                    margin: EdgeInsets.all(5.0),
                    child: ListView(
          scrollDirection: Axis.vertical,
          children: [
             Container(
                        width: mediaQuery.width,
                        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
          
          shadowColor: Color(0x802196F3),
          child: Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset("assets/Capture.PNG"),
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: mediaQuery.width / 3.75,
                    child: Text(
                      "Chaussures",
                      style: styleTexte,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "3000 XAF",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.orangeAccent),
                      
                    ),
                  )
                ],
              ),
            ),

Spacer(),
           Container(
            width: 40.0,
            
            child: Row(
              children: <Widget>[
                Container(
                  width: 20,
                  // flex: 1,
                  child: Text(_controller.toString(), textAlign: TextAlign.center,),
                ),
                Spacer(),
                Container(
                  height: 38.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 18.0,
                          ),
                          onTap: () {
                            setState(() {
                              _controller++;
                            });
                          },
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 18.0,
                        ),
                        onTap: () {
                          setState(() {
                                _controller > 1 ? _controller-- : _controller; // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        

    // SizedBox(width: mediaQuery.width / 10),
  //   Container(
  //     height: 100,
  //   width: 50,
  //   child: 
  //          NumberPicker.integer(
  //       // listViewWidth: 10,
  //       selectedTextStyle: TextStyle(fontSize: 15, color: Colors.black),
  //           initialValue: _currentValue,
  //           scrollDirection: Axis.horizontal,
  //           minValue: 1,
  //           highlightSelectedValue: true,
  //           maxValue: 100,
  //           onChanged: (value) =>  _currentValue = --value,
  //          ),
  //   ),

  // // child: Row(
  //   children: [
  //     Text("8"),
  //     Icon(FontAwesomeIcons.sort, )
  //   ],
  // ),

Spacer(),

Container(
  margin: EdgeInsets.only(right: 15.0),
  child:
Icon(FontAwesomeIcons.timesCircle, color: Color(orangeEclatant),))
        
        
      ],
    ),
    ),
    ),
    ],
    ),
              ),
            ),


            Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: mediaQuery.height / 15,
                  width: mediaQuery.width / 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(FontAwesomeIcons.wallet, color: Color(orangeEclatant),),
                ),
                Spacer(),
               TextButton(
                                child: Row(
                   children: [
                      Text("Vider le panier", style: styleTexte,),
                  const SizedBox(width: 10),
                  Icon(
                    FontAwesomeIcons.trashAlt,
                    size: 12,
                    color: Color(orangeEclatant),
                  )

                   ]
                 ),
                 onPressed: (){},
               )
                
                
              ],
            ),
            SizedBox(height: mediaQuery.height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width / 2.2,
                  child: SizedBox(
      width: mediaQuery.width / 2,
      height: 50.0,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: Color(orangeEclatant),
        ),
        onPressed: (){
          print(_controller.toString());
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavorisProductScreen()));
          },
        child: Text(
          "Commander ",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
          ],
          ),
        ),
    );
  }
}