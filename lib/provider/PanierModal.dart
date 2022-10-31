import 'dart:collection';

import 'package:flutter/material.dart';

import '../modal/Article.dart';

class PanierModal extends ChangeNotifier {

  List<Article> _articles = [];

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  void add(Article item) {
    _articles.add(item);
    notifyListeners();
    print(_articles);
  }
}