import 'package:alexislucas/modal/Historique.dart';
import 'package:alexislucas/provider/HistoriqueModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoriquePage extends StatelessWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home, color: Colors.white),
        title: Text("Historique des commandes"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<HistoriqueModal>(
            builder: (context, historiqueModal, child) {
              List<Historique> historiques = historiqueModal.historiques;
              return ListView.builder(
                itemCount: historiques.length,
                itemBuilder: (context, index) {
                  Historique currentHistorique = historiques[index];
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
                        child: Image.asset(currentHistorique.articles[1].image, fit: BoxFit.cover),
                      ),
                      title: Text("Commande de ${currentHistorique.contact.name}"),
                      subtitle: (Text("Nombre d'articles: ${currentHistorique.quantite}")),
                      trailing: Text("Total: ${currentHistorique.total}€"),
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
