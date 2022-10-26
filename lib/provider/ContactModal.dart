

import 'dart:collection';

import 'package:flutter/material.dart';

import '../modal/Contact.dart';

class ContactModal extends ChangeNotifier{
  List<Contact> _contacts = [
    Contact(id: 1, name: 'tata', siret: '010101101', tel: '01522175154'),
    Contact(id: 2, name: 'toto', siret: '010101101', tel: '01522175154'),
    Contact(id: 3, name: 'titi', siret: '010101101', tel: '01522175154'),
    Contact(id: 4, name: 'tati', siret: '010101101', tel: '01522175154'),
    Contact(id: 5, name: 'tita', siret: '010101101', tel: '01522175154'),
    Contact(id: 6, name: 'tonton', siret: '010101101', tel: '01522175154'),
    Contact(id: 7, name: 'tart', siret: '010101101', tel: '01522175154'),
    Contact(id: 8, name: 'manger', siret: '010101101', tel: '01522175154'),
    Contact(id: 9, name: 'fin', siret: '010101101', tel: '01522175154'),
    Contact(id: 10, name: 'debut', siret: '010101101', tel: '01522175154'),
    Contact(id: 11, name: 'stop', siret: '010101101', tel: '01522175154'),
    Contact(id: 12, name: 'fate', siret: '010101101', tel: '01522175154'),
    Contact(id: 13, name: 'moi', siret: '010101101', tel: '01522175154'),
    Contact(id: 14, name: 'toi', siret: '010101101', tel: '01522175154'),
    Contact(id: 15, name: 'lui', siret: '010101101', tel: '01522175154'),
    Contact(id: 16, name: 'elle', siret: '010101101', tel: '01522175154'),
    Contact(id: 17, name: 'huig', siret: '010101101', tel: '01522175154'),
  ];

  UnmodifiableListView<Contact> get contacts =>  UnmodifiableListView(_contacts);
}