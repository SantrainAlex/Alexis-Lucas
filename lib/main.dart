import 'package:flutter/material.dart';
import './VueArticle/AritucleVue.dart';
import 'modal/ListeContact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListContact(),
    );
  }
}
class ListContact extends StatelessWidget {
  const ListContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ListeContact>(),
    );
  }
}


