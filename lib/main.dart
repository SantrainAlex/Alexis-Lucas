import 'package:alexislucas/provider/ArticleModal.dart';
import 'package:alexislucas/provider/ContactModal.dart';
import 'package:alexislucas/provider/HistoriqueModal.dart';
import 'package:alexislucas/provider/PanierModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/footer.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ArticleModal>(create: (context) => ArticleModal()),
      ChangeNotifierProvider<ContactModal>(create: (context) => ContactModal()),
      ChangeNotifierProvider<HistoriqueModal>(create: (context) => HistoriqueModal()),
      ChangeNotifierProvider<PanierModal>(create: (context) => PanierModal()),
    ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}



