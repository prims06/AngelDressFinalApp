import 'package:angeldress/sources/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    
  }) : super(key: key);
  final String text;
  final Function press;
  

  @override
  Widget build(BuildContext context) {
    
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      width: mediaQuery.width/1.3,
      height: mediaQuery.height /15,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(orangeEclatant),
        onPressed: press,
        child: 
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          
      ),
    );
  }
}
