

import 'package:firebase_core/firebase_core.dart';

class Product{
  final String productId;
  final String nomProduit;
  final int salePrice;
  final double price;
  final int qteDisponible;
  final int qteVendu;
  final String categorie;
  final bool exchange;
  final String statut;
  final String description;
  final List<String> images;
  final double rate;
  final int signalements;
  final DateTime uploadDate;
  final String sellerUID;

   
  

  Product(this.productId, this.nomProduit, this.salePrice, this.price, this.qteDisponible, this.qteVendu, this.categorie, this.exchange, this.statut, this.description, this.images, this.rate, this.signalements,this.uploadDate, this.sellerUID);

 //  factory product.fromJson(Map<String, dynamic> prod)
Map<String, dynamic> toMap() {
    return {
      "productId":productId,
      "nomProduit": nomProduit,
      "salePrice": salePrice,
      "price": price,
      "qteDisponible": qteDisponible,
      "qteVendu": qteVendu,
      "categorie": categorie,
      "description": description,
      "images": images,
      "rate": rate,
      "signalements": signalements,
      "sellerUID": sellerUID,
      "exchange":exchange,
      "statut":statut,
      "uploadDate":uploadDate
    };
  }
}