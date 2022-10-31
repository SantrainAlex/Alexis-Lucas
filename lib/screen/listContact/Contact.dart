import 'package:alexislucas/screen/listContact/ListContact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../modal/Article.dart';
import '../../modal/Contact.dart';
import '../../provider/ArticleModal.dart';
import 'ListeArticleContact.dart';

class ContactSlectionner extends StatelessWidget {
  const ContactSlectionner({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text("Détail du client"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage('/images/contact.png'),
                height: 50,
              ),
            ),
            Text('${contact.name}', style: TextStyle(fontSize: 10)),
            Text(
              'tel: ${contact.tel} N°Siret: ${contact.siret}',
              style: TextStyle(fontSize: 10),
            ),
            Text('Vendu'),
            ListeArticleContact(value: 2),
            Text('Acheter'),
            ListeArticleContact(value: 3),
          ],
        ),
        /*
        child:  */
      ),
    );
  }
}