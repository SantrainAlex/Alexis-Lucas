import 'package:alexislucas/provider/ArticleModal.dart';
import 'package:alexislucas/provider/ContactModal.dart';
import 'package:alexislucas/screen/Facture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/footer.dart';
import 'modal/Article.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticleModal>(
            create: (context) => ArticleModal()),
        ChangeNotifierProvider<ContactModal>(
            create: (context) => ContactModal()),
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
      home: Facture(),
    );
  }
}

