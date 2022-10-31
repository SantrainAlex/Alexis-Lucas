import 'dart:collection';

import 'package:flutter/material.dart';

import '../modal/Article.dart';

class PanierModal extends ChangeNotifier {

  List<Article> articles = [];

  UnmodifiableListView<Article> get getArticles => UnmodifiableListView(articles);

  void add(Article item) {
    articles.add(item);
    notifyListeners();
    print(articles);
  }

  int getQuantite() {
    return articles.length;
  }

  double getPrixTotal() {
    double prixTotal = 0;
    Article currentArticle;
    for(int i = 0; i < articles.length; i++) {
      currentArticle = articles[i];
      double prixArticle = currentArticle.prix;
      prixTotal += prixArticle;
    }
    return prixTotal;
  }

  void clearPanier() {
    articles.clear();
    notifyListeners();
  }
}