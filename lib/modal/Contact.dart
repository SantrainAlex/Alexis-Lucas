import 'package:uuid/uuid.dart';

class Contact{

  final Uuid id;
  final String name;
  final String siret;
  final String tel;
  Contact({this.id = const Uuid(), required this.name, required this.siret, required this.tel});
}