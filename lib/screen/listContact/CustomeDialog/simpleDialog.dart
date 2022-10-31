import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modal/Contact.dart';
import '../../../provider/ContactModal.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tel = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _siret = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un contact'),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              validator: (text) => validator(text),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Nom"),
              ),
            ),
            TextFormField(
              controller: _tel,
              validator: (text) => validator(text),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("tel"),
              ),
            ),
            TextFormField(
              controller: _siret,
              validator: (text) => validator(text),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("siret"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<ContactModal>(context, listen: false)
                        .add(Contact(name: _name.text, siret: _siret.text, tel: _tel.text));
                    Navigator.pop(context);
                  }
            },
                child: const Text("Valider"))
          ],
        ),
      ),
    );
  }

  String? validator(String? text) {
    if (text!.isEmpty) {
      return "Veuillez remplir le champ ";
    } else {
      return null;
    }
  }

}
