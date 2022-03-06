import 'dart:io';

import 'package:angeldress/models/class/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService{
final CollectionReference collectionProduit = FirebaseFirestore.instance.collection("Products");

// FirebaseStorage storage = FirebaseStorage.instance;
// firebase_storage.FirebaseStorage storage =
//   firebase_storage.FirebaseStorage.instance;
//   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//     .ref('assets/prod.jpg');
// Future uploadImage(File image) async{
//   final fileName = basename(image.path);
// }

  Future<String> uploadImage(File file, {String path}) async {
    
    var time = DateTime.now().toString();
    var ext = Path.basename(file.path).split(".")[1].toString();
    String image = path + "_" + time + "." + ext;
    try {
      Reference ref =
          FirebaseStorage.instance.ref().child(path + "/" + image);
      UploadTask upload = ref.putFile(file);
      await upload.whenComplete(() => {print("done...")});
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }
    static UploadTask uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  Future saveProduct(Product product) async {
    try {
      // product.productId = collectionProduit.doc().id;
      await collectionProduit.doc(product.productId).set(product.toMap());
      
      return true;
    } catch (e) {
      return false;
    }
  }

}