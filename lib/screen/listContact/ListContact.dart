import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/Contact.dart';
import '../../modal/ContactModal.dart';
import 'Contact.dart';
import 'CustomeDialog/simpleDialog.dart';

class ListContact extends StatelessWidget {
  const ListContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<ContactModal>(
          builder: (context, contactModal, child) {
            List<Contact> contacts = contactModal.contacts;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                Contact currentItem = contacts[index];
                return Card(
                  elevation: 20,
                  margin: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Text('${currentItem.name}'),
                    trailing: Icon(Icons.arrow_right),
                    leading: Container(
                      width: 20,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('/images/contact.png'))),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactSlectionner(
                          contact: currentItem,
                        ),
                      ));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addContact(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void addContact(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog();
      },
    );
  }
}
