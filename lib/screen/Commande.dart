import 'package:alexislucas/modal/Historique.dart';
import 'package:alexislucas/modal/Panier.dart';
import 'package:alexislucas/provider/HistoriqueModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Article.dart';
import '../modal/Contact.dart';
import '../provider/ArticleModal.dart';
import '../provider/ContactModal.dart';
import '../provider/PanierModal.dart';
import 'VueArticle/ArticleVue.dart';
class Commande extends StatefulWidget {
  const Commande({Key? key}) : super(key: key);

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  Contact? listeContact;
  static const List<String> venteAchat = <String>['Vente', 'Achat'];
  static String valueachatVente = '';
  var selectedContact;
  var listePanier;
  var isAchat;
  var lenghtPanier;
  var totalPanier;


  @override
  void initState() {
    // TODO: implement initState
    valueachatVente = venteAchat.first;
    listeContact =
        Provider.of<ContactModal>(context, listen: false).contacts.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.home, color: Colors.white),
        ),

        title: Text("Passer une commande "),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Consumer<ContactModal>(
                      builder: (context, contactModal, child) {
                        return DropdownButton(
                          alignment: Alignment.center,
                          value: listeContact,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: contactModal.contacts.map((contact) {
                            return DropdownMenuItem(
                                value: contact,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Text(
                                    '${contact.name}',
                                  ),
                                ));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              listeContact = value!;
                              selectedContact = value;
                            });
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: DropdownButton(
                      underline: Container(
                        height: 5,
                      ),
                      value: valueachatVente,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: venteAchat.map((value) {
                        return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: value,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                '$value',
                              ),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          valueachatVente = value!;
                          if (value! == "Vente") {
                            isAchat = true;
                          } else {
                            isAchat = false;
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Consumer<PanierModal>(
                  builder: (context, panierModal, child) {
                    List<Article> articles = panierModal.getArticles;
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        Article currentArticle = articles[index];
                        listePanier = articles;
                        lenghtPanier = panierModal.getQuantite();
                        totalPanier = panierModal.getPrixTotal();
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
                            subtitle: Container(
                              child: Row(
                                children: [
                                  (currentArticle.quantite >= 4)
                                      ? Text("En stock")
                                      : (currentArticle.quantite < 4 &&
                                      currentArticle.quantite > 1)
                                      ? Text(
                                      "${currentArticle.quantite} exemplaires restants")
                                      : (currentArticle.quantite == 1)
                                      ? Text("1 exemplaire restant")
                                      : Text("Stock épuisé"),
                                ],
                              ),
                            ),
                            trailing: Text("${currentArticle.prix} €"),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ArticleVue(article: currentArticle)));
                            },
                          ),
                        );
                      },
                    );
                  }),
            ),
            TextButton(
                onPressed: () {
                  print(lenghtPanier);
                  print(listePanier);
                  print(isAchat);
                  Historique historique = Historique(articles: listePanier, contact: selectedContact, isAchat: isAchat, quantite: lenghtPanier, total: totalPanier);
                  print("Quantité ${historique.quantite}");
                  print("Prix ${historique.total}");
                  Provider.of<HistoriqueModal>(context, listen: false).add(historique);
                  Provider.of<PanierModal>(context, listen: false).clearPanier();
                  Navigator.pop(context);
                },
                child: Text('Valider la commande ')),
          ],
        ),
      ),
    );
  }
}