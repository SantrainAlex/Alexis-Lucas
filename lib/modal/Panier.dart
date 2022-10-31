import 'package:uuid/uuid.dart';

import 'Article.dart';

class Panier {

  final Uuid id;
  final List<Article> articles;
  final int quantite;
  final double total;

  Panier({this.id = const Uuid(), required this.articles, required this.quantite, required this.total});
}