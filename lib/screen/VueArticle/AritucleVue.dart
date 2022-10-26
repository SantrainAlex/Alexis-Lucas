import 'package:flutter/material.dart';
class AritucleVue extends StatelessWidget {
  const AritucleVue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/planteHome.webp')
                  )
              ),
            ),
            Container(
                width: 200,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Acer 3000'),
                    Text("300 €")
                  ],
                )
            ),
            Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(),)),
              child: Text(
                  "éatoires. Vous choisissez le nombre de paragraphes, de mots ou de listes. Vous obtenez alors un texte aléatoire que vous pourrez ensuite utiliser librement dans vos maquettes."
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.only(right: 20, top: 20), child:
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black12, width: 1),
                      shape: BoxShape.rectangle,
                    ),
                    child: InkWell(

                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        // do something here
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("4 en stock", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )
                  ,),
              ],
            )
          ],
        ),
      ),
    );
  }
}