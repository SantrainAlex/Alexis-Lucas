import 'package:alexislucas/provider/ArticleModal.dart';
import 'package:alexislucas/provider/PanierModal.dart';
import 'package:alexislucas/screen/Commande.dart';
import 'package:alexislucas/screen/VueArticle/ArticleVue.dart';
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
        padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<ArticleModal>(
          builder: (context, articleModal, child) {
            List<Article> articles = articleModal.articles;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article currentArticle = articles[index];
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
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
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ArticleVue(article: currentArticle)
                            ));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            (currentArticle.quantite == 0) ?
                                Text('Ajouter au panier', style: TextStyle(color: Colors.grey),)
                            :
                            TextButton(
                              child: const Text('Ajouter au panier'),
                              onPressed: () {
                                Provider.of<PanierModal>(context, listen: false).add(currentArticle);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Commande()
          ));
        },
        label: const Text('Commander'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
