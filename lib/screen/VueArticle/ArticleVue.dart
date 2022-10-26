import 'package:alexislucas/modal/Article.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../HomePage/homepage.dart';
class ArticleVue extends StatelessWidget {
  const ArticleVue({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyStatefulWidget(pageSelected: 1)
              ));
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          title: Text("Détail de l'article"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(article.image, fit: BoxFit.cover, width: 300),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(article.nom,
                      style:
                      TextStyle(color: Colors.blueGrey[800]!,fontWeight: FontWeight.w900, fontSize: 25)),
                ),
                Container(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Give them enough time and these pretty Bird of Paradise plants grow stunning orange flowers. As if they weren't impressive enough already!",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300]!, width: 1),
                        shape: BoxShape.rectangle),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                      child: (article.quantite >= 4)
                          ? Text("En stock",style: TextStyle(color: Colors.blueGrey[800]!, fontWeight: FontWeight.w500, fontSize: 22))
                          : (article.quantite < 4 && article.quantite > 1)
                          ? Text("${article.quantite} exemplaires restants",style: TextStyle(color: Colors.blueGrey[800]!, fontWeight: FontWeight.w500, fontSize: 22))
                          : (article.quantite == 1)
                          ? Text("1 exemplaire restant",style: TextStyle(color: Colors.blueGrey[800]!, fontWeight: FontWeight.w500, fontSize: 22))
                          : Text("Stock épuisé",style: TextStyle(color: Colors.blueGrey[800]!, fontWeight: FontWeight.w500, fontSize: 22)),
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        color: Colors.greenAccent),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shopping_bag, color: Colors.white),
                          Container(
                            width: 10,
                          ),
                          Text("${article.prix}€",
                              style: TextStyle(color: Colors.white, fontSize: 18))
                        ],
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}