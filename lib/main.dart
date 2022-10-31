
import 'package:alexislucas/provider/ArticleModal.dart';
import 'package:alexislucas/provider/ContactModal.dart';
import 'package:alexislucas/provider/HistoriqueModal.dart';
import 'package:alexislucas/provider/PanierModal.dart';
import 'package:alexislucas/screen/HistoriquePage/HistoriquePage.dart';
import 'package:alexislucas/screen/HomePage/homepage.dart';
import 'package:alexislucas/screen/listContact/ListContact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: MyStatefulWidget(pageSelected: 1),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, required this.pageSelected});

  final int pageSelected;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 1;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ListContact(),
    HomePage(),
    HistoriquePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historique',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}



