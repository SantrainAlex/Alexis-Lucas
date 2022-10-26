import 'dart:collection';

import 'package:flutter/material.dart';

import '../modal/Article.dart';

class ArticleModal extends ChangeNotifier {

  List<Article> _articles = [
    Article(id: 1, nom: "Ordinateur", prix: 600, numeroSerie: "664321466114", quantite: 1, image: "assets/images/ordinateur.png"),
    Article(id: 2, nom: "Souris", prix: 20, numeroSerie: "4565424367", quantite: 16, image: "assets/images/souris.jpg"),
    Article(id: 3, nom: "Clavier", prix: 30, numeroSerie: "4456432567", quantite: 18, image: "assets/images/clavier.png"),
    Article(id: 4, nom: "Ecran", prix: 150, numeroSerie: "88675453734", quantite: 0, image: "assets/images/ecran_1.png"),
    Article(id: 5, nom: "Disque dur", prix: 60, numeroSerie: "7745522123", quantite: 2, image: "assets/images/disque_dur.jpg"),
    Article(id: 1, nom: "Ordinateur", prix: 600, numeroSerie: "664321466114", quantite: 1, image: "assets/images/ordinateur.png"),
    Article(id: 2, nom: "Souris", prix: 20, numeroSerie: "4565424367", quantite: 16, image: "assets/images/souris.jpg"),
    Article(id: 3, nom: "Clavier", prix: 30, numeroSerie: "4456432567", quantite: 18, image: "assets/images/clavier.png"),
    Article(id: 4, nom: "Ecran", prix: 150, numeroSerie: "88675453734", quantite: 0, image: "assets/images/ecran_1.png"),
    Article(id: 5, nom: "Disque dur", prix: 60, numeroSerie: "7745522123", quantite: 2, image: "assets/images/disque_dur.jpg"),
  ];

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);
}