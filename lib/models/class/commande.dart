import 'dart:ffi';

import 'package:angeldress/models/class/product.dart';

class commande {
  final List<Product> products;
  final Double montant;
  final String statut;
  final DateTime dateCommande;

  commande(this.products, this.montant, this.statut, this.dateCommande);

}