import 'package:uuid/uuid.dart';

import 'Article.dart';

class Panier {

  final Uuid id;
  final List<Article> articles;

  Panier({this.id = const Uuid(), required this.articles});
}