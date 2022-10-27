

import 'dart:collection';

import 'package:flutter/material.dart';

import '../modal/Contact.dart';

class ContactModal extends ChangeNotifier{
  List<Contact> _contacts = [
    Contact(name: 'tata', siret: '010101101', tel: '01522175154'),
    Contact(name: 'toto', siret: '010101101', tel: '01522175154'),
    Contact(name: 'titi', siret: '010101101', tel: '01522175154'),
    Contact(name: 'tati', siret: '010101101', tel: '01522175154'),
    Contact(name: 'tita', siret: '010101101', tel: '01522175154'),
    Contact(name: 'tonton', siret: '010101101', tel: '01522175154'),
    Contact(name: 'tart', siret: '010101101', tel: '01522175154'),
    Contact(name: 'manger', siret: '010101101', tel: '01522175154'),
    Contact(name: 'fin', siret: '010101101', tel: '01522175154'),
    Contact(name: 'debut', siret: '010101101', tel: '01522175154'),
    Contact(name: 'stop', siret: '010101101', tel: '01522175154'),
    Contact(name: 'fate', siret: '010101101', tel: '01522175154'),
    Contact(name: 'moi', siret: '010101101', tel: '01522175154'),
    Contact(name: 'toi', siret: '010101101', tel: '01522175154'),
    Contact(name: 'lui', siret: '010101101', tel: '01522175154'),
    Contact(name: 'elle', siret: '010101101', tel: '01522175154'),
    Contact(name: 'huig', siret: '010101101', tel: '01522175154'),
  ];

  UnmodifiableListView<Contact> get contacts =>  UnmodifiableListView(_contacts);

  void add(Contact item) {
    _contacts.add(item);
    notifyListeners();
  }
}