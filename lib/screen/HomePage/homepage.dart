import 'package:alexislucas/provider/ArticleModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/Article.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home, color: Colors.white),
        title: Text("Les Produits"),
      ),
      body: Container(
        child: Consumer<ArticleModal>(
          builder: (context, articleModal, child) {
            List<Article> articles = articleModal.articles;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article currentArticle = articles[index];
                return Card(
                  elevation: 20,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 64,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.asset(currentArticle.image, fit: BoxFit.cover),
                    ),
                    title: Text(currentArticle.nom),
                    subtitle: (currentArticle.quantite >= 4)
                      ? Text("En stock")
                      : (currentArticle.quantite < 4 && currentArticle.quantite > 1)
                      ? Text("${currentArticle.quantite} exemplaires restants")
                      : (currentArticle.quantite == 1)
                      ? Text("1 exemplaire restant")
                      : Text("Stock épuisé"),
                    trailing: Text("${currentArticle.prix} €"),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
