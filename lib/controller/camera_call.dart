import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:angeldress/sources/variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../models/setting_profile_component.dart';
import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
class CameraCall{
  File file;
final imagePicker = ImagePicker();
_openGallery(BuildContext context)async{
  final imgFile = await imagePicker.getImage(source: ImageSource.gallery);

 return File(imgFile.path);
  
  
  Navigator.of(context).pop();
}
_openCamera(BuildContext context) async{
  // final imgFile<XFile> = await imagePicker.getImage(source: ImageSource.gallery);
  final imgFile = await imagePicker.getImage(source: ImageSource.camera);
 return File(imgFile.path);

  Navigator.of(context).pop();
}

//Boite de dialogue camera
Future<void> _showDialog(BuildContext context){
  // ignore: missing_return
  return showDialog(context: context,builder: (BuildContext context){
    return AlertDialog(
      title: Text("Choississez votre source", style: styleTexte,),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.camera, color: Color(orangeEclatant),),
                    SizedBox(width: 10.0),
                    Text("Camera", style: styleTexte,),
                  ],
                ),
                onTap: (){file=_openCamera(context);},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.image, color: Color(orangeEclatant)),
                    SizedBox(width: 10.0),
                    Text("Gallery", style: styleTexte,),
                  ],
                ),
                onTap: (){file=_openGallery(context);},
              ),
            ),
          ],
        ),
      ),
    );
  });
}

// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');

//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

//   return file;
// }

Future<File> getImageFileFromAssets(Asset asset) async {
    final byteData = await asset.getByteData();

    final tempFile = File("${(await getTemporaryDirectory()).path}/${asset.name}");
    final file = await tempFile.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );

    return file;
  }

}