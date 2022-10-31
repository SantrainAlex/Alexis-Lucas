import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/Article.dart';
import '../../provider/ArticleModal.dart';

class ListeArticleContact extends StatelessWidget {
  const ListeArticleContact({Key? key, required this.value}) : super(key: key);
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Consumer<ArticleModal>(
          builder: (context, articleModal, child) {
            List<Article> articles = articleModal.articles;
            return ListView.builder(
              itemCount: value,
              itemBuilder: (context, index) {
                Article currentArticle = articles[index];
                return Card(
                  elevation: 20,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 64,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.asset(currentArticle.image,
                          fit: BoxFit.cover),
                    ),
                    title: Text(currentArticle.nom),
                    subtitle: (currentArticle.quantite >= 4)
                        ? Text("En stock")
                        : (currentArticle.quantite < 4 &&
                        currentArticle.quantite > 1)
                        ? Text(
                        "${currentArticle.quantite} exemplaires restants")
                        : (currentArticle.quantite == 1)
                        ? Text("1 exemplaire restant")
                        : Text("Stock épuisé"),
                    trailing: Text("${currentArticle.prix} €"),
                  ),
                );
              },
            );
          }),
    );
  }
}
