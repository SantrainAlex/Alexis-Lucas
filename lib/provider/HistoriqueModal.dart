import 'dart:collection';

import 'package:alexislucas/modal/Contact.dart';
import 'package:alexislucas/modal/Historique.dart';
import 'package:flutter/material.dart';

import '../modal/Article.dart';

class HistoriqueModal extends ChangeNotifier {

  static List<Article> articles = [
    Article(id: 1, nom: "Ordinateur", prix: 600, numeroSerie: "664321466114", quantite: 2, image: "assets/images/ordinateur.png"),
    Article(id: 2, nom: "Souris", prix: 20, numeroSerie: "4565424367", quantite: 1, image: "assets/images/souris.jpg"),
    Article(id: 3, nom: "Clavier", prix: 30, numeroSerie: "4456432567", quantite: 5, image: "assets/images/clavier.png"),
  ];

  static Contact contact = Contact(name: 'toto', siret: '010101101', tel: '01522175154');

  List<Historique> _historiques = [
    Historique(articles: articles, contact: contact, isAchat: false, quantite: getQuantite(), total: getPrixTotal())
  ];

  UnmodifiableListView<Historique> get historiques => UnmodifiableListView(_historiques);


  static int getQuantite() {
    int quantiteTotal = 0;
    Article currentArticle;
    for(int i = 0; i < articles.length; i++) {
     currentArticle = articles[i];
     int quantiteArticle = currentArticle.quantite;
     quantiteTotal += quantiteArticle;
    }
    return quantiteTotal;
  }

  static double getPrixTotal() {
    double prixTotal = 0;
    Article currentArticle;
    for(int i = 0; i < articles.length; i++) {
      currentArticle = articles[i];
      double prixArticle = currentArticle.quantite * currentArticle.prix;
      prixTotal += prixArticle;
    }
    return prixTotal;
  }
}