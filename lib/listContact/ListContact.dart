import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/Contact.dart';
import '../provider/ContactModal.dart';

class ListContact extends StatelessWidget {
  const ListContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  trailing: IconButton(onPressed: () => print('btn suivant'), icon: Icon(Icons.arrow_right,),),
                  leading: Container(
                    width: 20,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('/images/contact.png')
                        )
                    ),
                  ),
                ),
              );
            },);
        },
      ),
    );
  }
}