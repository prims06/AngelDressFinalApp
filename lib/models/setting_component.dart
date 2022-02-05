
import 'package:angeldress/sources/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class SettingComponent extends StatelessWidget {

  const SettingComponent({
    
    @required this.text,
    @required this.icon,
    @required this.iconEnd,
    this.profilPress,
  });
  final String text;
  final   icon;
  final   iconEnd;
  final VoidCallback profilPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: FlatButton(
        // disabledColor: Colors.black38,
        // color: Colors.black38.withOpacity(0.1),
        // disabledColor: Colors.black38.withOpacity(0.1),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: this.profilPress,
        child: Row(
          children: [
            Icon(
              icon,
              color: Color(orangeEclatant),
              size: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text, style: GoogleFonts.montserrat(fontSize: 20.0,color: Color(0xff707070),),),),
            Icon(this.iconEnd, color: Color(orangeEclatant),),
          ],
        ),
      ),
    );
  }
}
