import 'package:alexislucas/modal/Article.dart';
import 'package:alexislucas/modal/Contact.dart';
import 'package:uuid/uuid.dart';

class Historique {

  final Uuid id;
  final List<Article> articles;
  final Contact contact;
  final bool isAchat;
  final int quantite;
  final double total;

  Historique({ this.id = const Uuid(), required this.articles, required this.contact, required this.isAchat ,required this.quantite, required this.total});
}